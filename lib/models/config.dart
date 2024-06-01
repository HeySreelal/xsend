import 'dart:convert';
import 'package:televerse/televerse.dart';

/// Represents a Mapped chat id with optional topic ID.
class MappedID {
  /// The Chat ID object
  final ID id;

  /// Optional topic id.
  final int? topic;

  const MappedID({
    required this.id,
    this.topic,
  });

  factory MappedID.fromMap(Map<String, dynamic> map) {
    return MappedID(
      id: ID.create(map["id"]),
      topic: map["topic"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id.id,
      "topic": topic,
    };
  }
}

class XsendConfig {
  /// Flag determines whether custom chat mapping for different content types
  bool get hasCustomChatMapping => chatIDMap?.isNotEmpty ?? false;

  /// The mapping of chat id against content type.
  final Map<String, MappedID>? chatIDMap;

  const XsendConfig({
    this.chatIDMap,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chat_id_map': chatIDMap?.map(
        (key, value) => MapEntry(
          key,
          value.toMap(),
        ),
      ),
    };
  }

  factory XsendConfig.fromMap(Map<String, dynamic> map) {
    Map<String, MappedID>? createChatIdMap(Map<String, dynamic>? idMap) {
      if (idMap == null) return null;
      return idMap.map(
        (key, value) => MapEntry(
          key,
          MappedID.fromMap(value),
        ),
      );
    }

    return XsendConfig(
      chatIDMap: createChatIdMap(
        map["chat_id_map"],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory XsendConfig.fromJson(String source) =>
      XsendConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}
