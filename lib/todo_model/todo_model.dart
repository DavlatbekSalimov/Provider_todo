import 'dart:convert';

String model = '';

class TodoM {
  String title;
  String decription;
  String dataTime;
  bool ischak;

  TodoM({
    required this.title,
    required this.decription,
    required this.dataTime,
    required this.ischak,
  });

  factory TodoM.fromJson(Map<String, dynamic> json) => TodoM(
        title: json["title"],
        decription: json["decription"],
        dataTime: json["dataTime"],
        ischak: json["ischak"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "decription": decription,
        "dataTime": dataTime,
        "ischak": ischak,
      };

  String result = jsonEncode(TodoM);
}
