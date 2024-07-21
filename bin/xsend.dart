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
  final isDebug = args.contains('--debug');
  final needStackTrace = args.contains('--stack');

  final xsendArgs = Args(
    isContent: isContent,
    path: path,
    chat: chat,
    isMedia: isMedia,
    isDebug: isDebug,
  );

  try {
    if (isDebug) {
      print(args);
      print("[debug] Starting the send process.");
    }

    await send(xsendArgs);
    if (isDebug) {
      print("[debug] Starting the send process.");
    }
  } catch (e, stack) {
    print('Oops, something went wrong!');
    printHelp();
    if (xsendArgs.isDebug) {
      print(e);
    }
    if (needStackTrace) {
      print(stack);
    }
  }
}
