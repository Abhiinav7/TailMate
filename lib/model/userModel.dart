
class UserModel {
  String name;
  String id;
  String email;
  String phone;

  UserModel({
    required this.name,
    required this.id,
    required this.phone,
    required this.email,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    id: json["id"],
    phone: json["phone"],
    email: json["email"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "phone": phone,
    "email": email,

  };
}
