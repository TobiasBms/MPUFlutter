class WorkoutResponse {
  int id;
  String title;
  String desc;
  String timeCap;

  WorkoutResponse(
      {required this.id,
      required this.title,
      required this.desc,
      required this.timeCap});

  factory WorkoutResponse.fromJson(Map<String, dynamic> json) {
    return WorkoutResponse(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      timeCap: json['timeCap'],
    );
  }
}
