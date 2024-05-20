import 'dart:convert';
import 'package:televerse/televerse.dart';

class XsendConfig {
  /// Flag determines whether custom chat mapping for different content types
  bool get hasCustomChatMapping => chatIDMap?.isNotEmpty ?? false;

  /// The mapping of chat id against content type.
  final Map<String, ID>? chatIDMap;

  const XsendConfig({
    this.chatIDMap,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chat_id_map': chatIDMap?.map((key, value) => MapEntry(key, value.id)),
    };
  }

  factory XsendConfig.fromMap(Map<String, dynamic> map) {
    return XsendConfig(
      chatIDMap: map['chat_id_map'] != null
          ? Map<String, ID>.from(
              ((map['chat_id_map'] as Map<String, dynamic>).map((key, value) {
              return MapEntry(key, ID.create(value));
            })))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory XsendConfig.fromJson(String source) =>
      XsendConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}
