import 'package:cross_fit_app/Models/workout_response.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key, required this.workoutResponse})
      : super(key: key);

  final WorkoutResponse workoutResponse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text(workoutResponse.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize)),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(workoutResponse.desc,
                    style: Theme.of(context).textTheme.bodyMedium),
                Chip(
                    backgroundColor: Colors.greenAccent,
                    avatar: Icon(Icons.access_time_outlined),
                    label: Text(workoutResponse.timeCap,
                        style: Theme.of(context).textTheme.bodySmall))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
