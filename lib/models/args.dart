import 'dart:io';

import 'package:televerse/televerse.dart';
import 'package:xsend/models/config.dart';

class Args {
  const Args._({
    this.isContent = false,
    this.chat,
    required this.isMedia,
    required this.path,
    this.hasCustomConfig = false,
    this.config,
  });

  /// When true, the content of the file is sent to the end user.
  final bool isContent;

  /// The path of the file to be sent.
  final String path;

  /// The chat to which the file is to be sent.
  final ID? chat;

  /// Whether the file is a media file or not.
  final bool isMedia;

  /// Flag to check if there's a custom configuration file exists
  final bool hasCustomConfig;

  /// The custom configuration data
  final XsendConfig? config;

  /// A class that contains the arguments to be passed to the `send` method.
  factory Args({
    required String path,
    bool isContent = false,
    bool isMedia = false,
    ID? chat,
  }) {
    final configPath = Platform.environment["XSEND_CONFIG_PATH"];
    final configFile = configPath != null ? File(configPath) : null;
    final hasCustomConfig = configFile?.existsSync() ?? false;
    return Args._(
      isMedia: isMedia,
      path: path,
      isContent: isContent,
      chat: chat,
      hasCustomConfig: hasCustomConfig,
      config: hasCustomConfig
          ? XsendConfig.fromJson(configFile!.readAsStringSync())
          : null,
    );
  }

  /// The extension of the file to be sent.
  String get fileExt {
    return path.split('.').last;
  }

  /// Extensions of photo files.
  final _photoExts = const ['jpg', 'png', 'jpeg'];

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

  /// Returns the Chat ID based on the parameters. Custom configuration can override
  /// the chat id specified by the -c flag.
  ID getChat() {
    final mappedId = config?.chatIDMap?[fileExt];

    if (mappedId != null) return mappedId;

    if (chat != null) return chat!;

    final env = Platform.environment['CHAT_ID'];
    final notAvailable = env == null || env.isEmpty;
    if (notAvailable) throw Exception("Could not find a Chat ID ");
    return ID.create(env);
  }
}
