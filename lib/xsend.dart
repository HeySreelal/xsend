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
      args.getChat(),
      "```${args.fileExt}\n$content```",
      parseMode: ParseMode.markdownV2,
      messageThreadId: args.getThreadId(),
    );
    return;
  }

  if (args.isMedia) {
    if (args.isPhoto) {
      await bot.api.sendPhoto(
        args.getChat(),
        InputFile.fromFile(file),
        messageThreadId: args.getThreadId(),
      );
    }
    if (args.isVideo) {
      await bot.api.sendVideo(
        args.getChat(),
        InputFile.fromFile(file),
        messageThreadId: args.getThreadId(),
      );
    }
  }

  await bot.api.sendDocument(
    args.getChat(),
    InputFile.fromFile(file),
    messageThreadId: args.getThreadId(),
  );

  print("Done!");
}
