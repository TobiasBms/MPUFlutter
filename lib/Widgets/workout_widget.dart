import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String timeCap;

  const WorkoutWidget({Key? key, required this.title, required this.desc, required this.timeCap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark
      ),
      child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0,0),
                child: Icon(Icons.add_chart, color: Colors.greenAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
              ),
              Expanded(child: Text(desc, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis)),
              Chip(
                backgroundColor: Theme.of(context).backgroundColor,
                label: Text(timeCap, style: Theme.of(context).textTheme.bodySmall),
              )
            ],
          ),
    );
  }
}
