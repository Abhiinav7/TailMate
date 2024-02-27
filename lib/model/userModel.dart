class UserModel {
  String name;
  String id;
  String email;
  String phone;
  String profileUrl;

  UserModel({
    required this.name,
    required this.id,
    required this.phone,
    required this.email,
    required this.profileUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json["name"],
      id: json["id"],
      phone: json["phone"],
      email: json["email"],
      profileUrl: json["profileUrl"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "phone": phone,
        "email": email,
        "profileUrl": profileUrl
      };
}
