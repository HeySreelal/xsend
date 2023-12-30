import 'dart:io';
import 'package:args/args.dart';
import 'package:televerse/televerse.dart';

Bot bot = Bot(Platform.environment['BOT_TOKEN']!);

Future<void> send(ArgResults results) async {
  final path = results['path'] as String;
  ID chat;
  if (results['chat'] == null) {
    chat = ChatID(int.parse(Platform.environment['CHAT_ID']!));
  } else {
    chat = ID.create(results['chat'] as String);
  }

  await bot.api.sendDocument(chat, InputFile.fromFile(File(path)));
  print("File sent!");
}
