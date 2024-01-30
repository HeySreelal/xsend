import 'dart:io';
import 'package:televerse/televerse.dart';
import 'package:xsend/help.dart';
import 'package:xsend/models/args.dart';
import 'package:xsend/xsend.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    printHelp();
    return;
  }

  final path = args[0];

  ID c;
  if (args.contains('-c')) {
    final chat = args[args.indexOf('-c') + 1];
    c = ID.create(chat);
  } else {
    c = ID.create(Platform.environment['CHAT_ID']!);
  }

  final isContent = args.contains('-t');

  try {
    final args = Args(isContent: isContent, path: path, chat: c);
    send(args);
  } catch (e) {
    printHelp();
  }
}
