class UserModel {
  UserModel({
    required this.login,
    required this.avatarUrl,
    required this.url,
    required this.reposUrl,
    required this.type,
    required this.name,
    required this.blog,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  String login;
  String avatarUrl;
  String url;
  String reposUrl;
  String type;
  String name;
  String blog;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        url: json["url"],
        reposUrl: json["repos_url"],
        type: json["type"],
        name: json["name"],
        blog: json["blog"],
        publicRepos: json["public_repos"],
        publicGists: json["public_gists"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "url": url,
        "repos_url": reposUrl,
        "type": type,
        "name": name,
        "blog": blog,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
