import 'dart:io';
import 'package:televerse/televerse.dart';
import 'package:xsend/models/args.dart';

Bot bot = Bot(Platform.environment['BOT_TOKEN']!);

Future<void> send(Args args) async {
  final file = File(args.path);

  if (args.isContent) {
    String content;
    try {
      content = file.readAsStringSync();
    } catch (e) {
      if (e is FileSystemException) {
        if (e.message == "Failed to decode data using encoding 'utf-8'") {
          print("You cannot send binary files in content mode.");
        } else {
          print("An error occured while reading the file.");
          print(e.message);
        }
      }
      content = "Could not read file.";
    }

    await bot.api.sendMessage(
      args.chat,
      "```${args.fileExt}\n$content```",
      parseMode: ParseMode.markdownV2,
    );
  } else {
    await bot.api.sendDocument(args.chat, InputFile.fromFile(file));
  }

  print("Done!");
}
