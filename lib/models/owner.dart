class Owner {
  String login;
  int id;
  String avatarUrl;
  String htmlUrl;
  Owner({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    data['html_url'] = this.htmlUrl;

    return data;
  }
}
