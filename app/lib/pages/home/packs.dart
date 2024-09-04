import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lw_file_system/lw_file_system.dart';
import 'package:material_leap/material_leap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:quokka/api/open.dart';
import 'package:quokka/bloc/world/bloc.dart';
import 'package:quokka/services/file_system.dart';
import 'package:quokka/widgets/search.dart';
import 'package:quokka_api/quokka_api.dart';

class PacksDialog extends StatefulWidget {
  final WorldBloc? bloc;

  const PacksDialog({
    super.key,
    this.bloc,
  });

  @override
  State<PacksDialog> createState() => _PacksDialogState();
}

class _PacksDialogState extends State<PacksDialog>
    with TickerProviderStateMixin {
  bool _isMobileOpen = false;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );
  late final QuokkaFileSystem _fileSystem = context.read<QuokkaFileSystem>();
  late final TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  Future<List<FileSystemFile<QuokkaData>>>? _packsFuture;
  (QuokkaData, String, bool)? _selectedPack;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: isWorldLoaded ? 3 : 2, vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _selectedPack = null;
          _isMobileOpen = false;
        });
      }
    });
    _packsFuture = _fileSystem.getPacks();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _reloadPacks() {
    if (mounted) {
      setState(() {
        _packsFuture = _fileSystem.getPacks();
      });
    }
  }

  bool get isWorldLoaded => widget.bloc != null;

  List<Widget> _buildDetailsChildren(QuokkaData pack, FileMetadata metadata) =>
      [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(metadata.description),
        ),
      ];

  List<Widget> _buildActionsChildren(
    QuokkaData pack, {
    VoidCallback? onInstall,
    VoidCallback? onRemove,
  }) =>
      [
        if (onInstall != null) ...[
          SizedBox(
            height: 42,
            child: FilledButton.tonalIcon(
              onPressed: onInstall,
              label: Text(AppLocalizations.of(context).install),
              icon: const Icon(PhosphorIconsLight.download),
            ),
          ),
        ],
        if (onRemove != null) ...[
          SizedBox(
            height: 42,
            child: FilledButton.tonalIcon(
              onPressed: onRemove,
              label: Text(AppLocalizations.of(context).remove),
              icon: const Icon(PhosphorIconsLight.trash),
            ),
          ),
        ],
      ];

  void _deselectPack() => _controller.reverse();

  Future<void> _removePack() async {
    _deselectPack();
    final pack = _selectedPack?.$2;
    if (pack == null) return;
    await _fileSystem.packSystem.deleteFile(pack);
    _reloadPacks();
  }

  bool _allowRemoving(String? id, bool? installed) =>
      id != kCorePackId && (installed ?? false);

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.sizeOf(context).width;
    final isMobile = currentSize < LeapBreakpoints.medium;
    Future<void> selectPack(QuokkaData pack, String id, bool installed) async {
      _controller.forward();
      setState(() {
        _selectedPack = (pack, id, installed);
        _isMobileOpen = isMobile;
      });
      final metadata = pack.getMetadataOrDefault();
      if (isMobile) {
        await showLeapBottomSheet(
          context: context,
          childrenBuilder: (context) => [
            ..._buildDetailsChildren(pack, metadata),
            const SizedBox(height: 16),
            ..._buildActionsChildren(
              pack,
              onInstall: installed ? null : _deselectPack,
              onRemove: _allowRemoving(id, installed) ? _removePack : null,
            ),
          ],
          titleBuilder: (context) => Text(metadata.name),
        );
        if (mounted) {
          _deselectPack();
        }
      }
    }

    final onInstall = _selectedPack?.$3 ?? false ? null : _deselectPack;
    final onRemove = _allowRemoving(_selectedPack?.$2, _selectedPack?.$3)
        ? _removePack
        : null;

    return ResponsiveAlertDialog(
      title: Text(AppLocalizations.of(context).packs),
      constraints: const BoxConstraints(
        maxWidth: LeapBreakpoints.expanded,
        maxHeight: 700,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabSearchView(
            tabController: _tabController,
            searchController: _searchController,
            tabs: [
              if (isWorldLoaded)
                HorizontalTab(
                  icon: const PhosphorIcon(PhosphorIconsLight.play),
                  label: Text(AppLocalizations.of(context).game),
                ),
              HorizontalTab(
                icon: const PhosphorIcon(PhosphorIconsLight.folder),
                label: Text(AppLocalizations.of(context).installed),
              ),
              HorizontalTab(
                icon: const PhosphorIcon(PhosphorIconsLight.globe),
                label: Text(AppLocalizations.of(context).browse),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: FutureBuilder<List<FileSystemFile<QuokkaData>>>(
              future: _packsFuture,
              builder: (context, snapshot) {
                final packs = snapshot.data ?? [];
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text(AppLocalizations.of(context).error,
                            style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 8),
                        Text(snapshot.error.toString()),
                      ],
                    ),
                  );
                }
                final view = ListenableBuilder(
                    listenable: _searchController,
                    builder: (context, _) {
                      final query = _searchController.text.toLowerCase();
                      final filtered = packs
                          .where((entry) =>
                              entry.data
                                  ?.getMetadata()
                                  ?.name
                                  .toLowerCase()
                                  .contains(query) ??
                              entry.fileName.toLowerCase().contains(query))
                          .toList();

                      var worldPacks = const <MapEntry<String, QuokkaData>>[];
                      final bloc = widget.bloc;
                      if (bloc != null) {
                        worldPacks = bloc.assetManager.packs.toList();
                      }

                      return TabBarView(
                        controller: _tabController,
                        children: [
                          if (isWorldLoaded)
                            BlocBuilder<WorldBloc, WorldState>(
                              bloc: bloc,
                              buildWhen: (previous, current) =>
                                  previous.info.packs != current.info.packs,
                              builder: (context, state) => ListView.builder(
                                itemCount: worldPacks.length,
                                itemBuilder: (context, index) {
                                  final entry = worldPacks[index];
                                  final id = entry.key;
                                  final data = entry.value;
                                  final metadata = data.getMetadata();
                                  return CheckboxListTile(
                                    title: Text(metadata?.name ??
                                        AppLocalizations.of(context).unnamed),
                                    subtitle: Text(id),
                                    value: state.info.packs.contains(id),
                                    onChanged: (value) {
                                      final packs =
                                          Set<String>.from(state.info.packs);
                                      if (value ?? false) {
                                        packs.add(id);
                                      } else {
                                        packs.remove(id);
                                      }
                                      bloc?.process(PacksChangeRequest(packs));
                                    },
                                  );
                                },
                              ),
                            ),
                          ListView.builder(
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              final pack = packs[index];
                              final key = pack.pathWithoutLeadingSlash;
                              final data = pack.data!;
                              final metadata = data.getMetadata();
                              return ListTile(
                                title: Text(metadata?.name ??
                                    AppLocalizations.of(context).unnamed),
                                subtitle: Text(key),
                                selected: _selectedPack?.$1 == data &&
                                    (!isMobile || _isMobileOpen),
                                onTap: () => selectPack(data, key, true),
                              );
                            },
                          ),
                          Center(
                            child:
                                Text(AppLocalizations.of(context).comingSoon),
                          ),
                        ],
                      );
                    });
                if (isMobile) {
                  return view;
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: view,
                    ),
                    SizeTransition(
                      sizeFactor: CurvedAnimation(
                        parent: _controller,
                        curve: Curves.fastOutSlowIn,
                      ),
                      axis: Axis.horizontal,
                      child: SizedBox(
                        width: 300,
                        child: Card(child: Builder(
                          builder: (context) {
                            final pack = _selectedPack?.$1;
                            if (pack == null) {
                              return const SizedBox();
                            }
                            final metadata = pack.getMetadataOrDefault();
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: _selectedPack?.$1 == null
                                  ? []
                                  : [
                                      Header(
                                        title: Text(metadata.name),
                                        actions: [
                                          IconButton.outlined(
                                            icon: const Icon(
                                                PhosphorIconsLight.x),
                                            onPressed: _deselectPack,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: ListView(
                                          children: _buildDetailsChildren(
                                            _selectedPack!.$1,
                                            metadata,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: _buildActionsChildren(
                                            pack,
                                            onInstall: onInstall,
                                            onRemove: onRemove,
                                          ),
                                        ),
                                      ),
                                    ],
                            );
                          },
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      leading: IconButton.outlined(
        icon: const Icon(PhosphorIconsLight.x),
        onPressed: () => Navigator.of(context).pop(),
      ),
      headerActions: [
        /*IconButton(
          icon: Icon(_gridView
              ? PhosphorIconsLight.list
              : PhosphorIconsLight.gridFour),
          onPressed: () => setState(() => _gridView = !_gridView),
        ),
        const SizedBox(height: 32, child: VerticalDivider()),*/
        IconButton(
          tooltip: AppLocalizations.of(context).import,
          onPressed: () => importFile(
            context,
            _fileSystem,
          ).then((_) => _reloadPacks()),
          icon: const Icon(PhosphorIconsLight.arrowSquareIn),
        ),
      ],
    );
  }
}
