class PetModel {
  String petName;
  String breed;
  int age;
  String gender;
  double weight;
  String discription;
  String imageUrl;
  String petId;
  String petType;
  String userId;
  String userName;
  var time;

  PetModel(
      {
        required this.userName,
        required this.time,
        required this.userId,
      required this.petType,
      required this.petName,
      required this.breed,
      required this.gender,
      required this.age,
      required this.weight,
      required this.discription,
      required this.imageUrl,
      required this.petId});

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
      petName: json["petName"],
      breed: json["breed"],
      gender: json["gender"],
      imageUrl: json["imageUrl"],
      age: json["age"],
      weight: json["weight"],
      discription: json["discription"],
      petType: json["petType"],
      petId: json["petId"],
      userId: json["userId"],
  time: json["time"],
  userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
        "petName": petName,
        "breed": breed,
        "gender": gender,
        "imageUrl": imageUrl,
        "age": age,
        "weight": weight,
        "discription": discription,
        "petType": petType,
        "petId": petId,
        "userId": userId,
    "time":time,
    "userName":userName
      };
}
