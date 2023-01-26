import 'dart:convert';
import 'package:cross_fit_app/Models/workout_response.dart';
import 'package:flutter/material.dart';

Future<List<WorkoutResponse>> readJsonFile(
  context,
  String filePath,
) async {
  final input = await DefaultAssetBundle.of(context).loadString(filePath);

  final List decodedWorkouts = jsonDecode(input);
  final List<WorkoutResponse> workouts =
      decodedWorkouts.map((e) => WorkoutResponse.fromJson(e)).toList();
  return workouts;
}
