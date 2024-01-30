import 'package:televerse/televerse.dart';

class Args {
  final bool isContent;

  final String path;

  final ID chat;

  const Args({
    required this.isContent,
    required this.path,
    required this.chat,
  });

  String get fileExt {
    return path.split('.').last;
  }
}
