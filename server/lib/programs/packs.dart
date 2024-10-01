import 'package:consoler/consoler.dart';
import 'package:quokka_api/quokka_api.dart';
import 'package:quokka_server/server.dart';

class PacksProgram extends ConsoleProgram {
  final QuokkaServer server;

  PacksProgram(this.server);

  @override
  String getDescription() => "Show all loaded packs";

  @override
  void run(String label, List<String> args) {
    print("-----");
    final packs = server.assetManager.packs.toList();
    print("Loaded ${packs.length} pack(s).");
    for (final pack in packs) {
      final checksum = pack.value.getChecksum();
      if (pack.key == kCorePackId) {
        print("| Core pack ($checksum)");
      } else {
        print("> ${pack.key} ($checksum)");
      }
    }
    print("-----");
  }
}
