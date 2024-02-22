
class EventModel {
  String description;
  String imgUrl;
  String time;

  EventModel({
    required this.description,
    required this.imgUrl,
    required this.time,

  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    description: json["description"],
    imgUrl: json["imgUrl"],
    time: json["time"],

  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "imgUrl": imgUrl,
    "time": time,

  };
}
