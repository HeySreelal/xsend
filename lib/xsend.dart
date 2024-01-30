import 'dart:io';
import 'package:televerse/televerse.dart';
import 'package:xsend/models/args.dart';

Bot bot = Bot(Platform.environment['BOT_TOKEN']!);

Future<void> send(Args args) async {
  final file = File(args.path);

  if (args.isContent) {
    await bot.api.sendMessage(
      args.chat,
      "```${args.fileExt}\n${file.readAsStringSync()}```",
      parseMode: ParseMode.markdownV2,
    );
  } else {
    await bot.api.sendDocument(args.chat, InputFile.fromFile(file));
  }

  print("Done!");
}
