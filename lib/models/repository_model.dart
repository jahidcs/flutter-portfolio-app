class RepositoryModel {
  RepositoryModel({
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    this.language,
    required this.visibility,
  });

  String name;
  String fullName;
  bool private;
  String htmlUrl;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  String? language;
  String visibility;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        htmlUrl: json["html_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        language: json["language"],
        visibility: json["visibility"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
        "private": private,
        "html_url": htmlUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pushed_at": pushedAt.toIso8601String(),
        "language": language,
        "visibility": visibility,
      };
}
