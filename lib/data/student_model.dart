class StudentEntry {
  Map<dynamic, dynamic> entries;
  String username;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  StudentEntry({
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

  static StudentEntry fromJson(Map<dynamic, dynamic>? json) =>
      StudentEntry(entries: json!['entries'] as Map<dynamic, dynamic>,
       username: json['username'] as String,
       objectId: json['objectId'] as String,
       created: json['created'] as DateTime,
       );
}
