class UserEntry {
  Map<dynamic, dynamic> entries;
  String username;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  UserEntry({
    required this.entries,
    required this.username,
    this.objectId,
    this.created,
    this.updated,
  });

  Map<String, Object?> toJson() => {
        'username': username,
        'entries': entries,
        'created': created,
        'updated': updated,
        'objectId': objectId,
      };

  static UserEntry fromJson(Map<dynamic, dynamic>? json) => UserEntry(
        username: json!['username'] as String,
        entries: json['entries'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
      );
}
