import 'package:televerse/televerse.dart';
import 'package:xsend/help.dart';
import 'package:xsend/models/args.dart';
import 'package:xsend/xsend.dart';

void main(List<String> args) async {
  if (args.isEmpty) {
    printHelp();
    return;
  }

  final path = args[0];

  ID? chat;
  if (args.contains('-c')) {
    final c = args[args.indexOf('-c') + 1];
    chat = ID.create(c);
  }

  final isContent = args.contains('-t');
  final isMedia = args.contains('-m');

  try {
    final args = Args(
      isContent: isContent,
      path: path,
      chat: chat,
      isMedia: isMedia,
    );
    await send(args);
  } catch (e) {
    print('Oops, something went wrong!');
    printHelp();
  }
}
