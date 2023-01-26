class ExerciseResponse {
     String title;
     String desc;

    ExerciseResponse({required this.title, required this.desc});

    factory ExerciseResponse.fromJson(Map<String, dynamic> json){

        return ExerciseResponse(
            title: json['title'],
            desc: json['desc']
        );
    }

}