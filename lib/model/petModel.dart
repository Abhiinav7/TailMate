class PetModel {
  String petName;
  String breed;
  int age;
  String gender;
  double weight;
  String discription;
  String imageUrl;
  String petId;

  PetModel({
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
        petId: json["petId"],
      );

  Map<String, dynamic> toJson() => {
        "petName": petName,
        "breed": breed,
        "gender": gender,
        "imageUrl": imageUrl,
        "age": age,
        "weight": weight,
        "discription": discription,
        "petId": petId,
      };
}
