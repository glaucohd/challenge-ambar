import 'package:challenge_get_user/models/owner.dart';

class User {
  int id;
  String name;
  Owner owner;

  User({
    this.id,
    this.name,
    this.owner,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}
