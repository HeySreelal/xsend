import 'package:televerse/televerse.dart';

class Args {
  /// When true, the content of the file is sent to the end user.
  final bool isContent;

  /// The path of the file to be sent.
  final String path;

  /// The chat to which the file is to be sent.
  final ID chat;

  /// Whether the file is a media file or not.
  final bool isMedia;

  /// A class that contains the arguments to be passed to the `send` method.
  const Args({
    required this.isContent,
    required this.path,
    required this.chat,
    this.isMedia = false,
  });

  /// The extension of the file to be sent.
  String get fileExt {
    return path.split('.').last;
  }

  /// Extensions of photo files.
  final _photoExts = const ['jpg', 'png'];

  /// Whether the file is a photo or not.
  ///
  /// Currently, only `jpg` and `png` files are considered photos.
  bool get isPhoto {
    return _photoExts.contains(fileExt);
  }

  /// Extensions of video files.
  final _videoExts = const ['mp4', 'mkv', 'webm'];

  /// Whether the file is a video or not.
  ///
  /// Currently, only `mp4`, `mkv` and `webm` files are considered videos.
  bool get isVideo {
    return _videoExts.contains(fileExt);
  }
}
