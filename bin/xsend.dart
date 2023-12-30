import 'package:args/args.dart';
import 'package:xsend/xsend.dart';

void main(List<String> args) {
  final ArgParser parser = ArgParser();
  parser.addOption(
    "path",
    abbr: "p",
    help: "Path to the file to send",
    mandatory: true,
    valueHelp: "/path/to/file",
  );

  parser.addOption(
    "chat",
    abbr: "c",
    help: "Chat ID to send the file to",
  );

  try {
    final results = parser.parse(args);
    send(results);
  } catch (e) {
    printHelp();
  }
}
