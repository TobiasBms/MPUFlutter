import 'package:cross_fit_app/Models/workout_response.dart';
import 'package:cross_fit_app/Pages/workout_page.dart';
import 'package:cross_fit_app/Widgets/workout_widget.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  final ScrollController _workoutsController = ScrollController();
  Future<List<WorkoutResponse>>? _workouts;

  @override
  void didUpdateWidget(covariant WorkoutsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _workouts = readJsonFile(context, "assets/workouts.json");
  }

  @override
  void dispose() {
    _workoutsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
      ),
      body: GestureDetector(
        onHorizontalDragStart: (event) {
          debugPrint("Drag started");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Welcome to workouts",
                      style: Theme.of(context).textTheme.headlineLarge)),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                      onPressed: () => print('clicked'),
                      icon: const Icon(Icons.arrow_circle_left)),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Text("text 1",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Text("text 1",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Text("text 1",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Text("text 1",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      IconButton(
                          onPressed: () => print("clicked right"),
                          icon: const Icon(Icons.arrow_circle_right))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<WorkoutResponse>>(
                  future: _workouts,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<WorkoutResponse>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WorkoutPage(
                                                          workoutResponse:
                                                              snapshot.data![
                                                                  index])))
                                        },
                                    child: WorkoutWidget(
                                        desc: snapshot.data![index].desc,
                                        title: snapshot.data![index].title,
                                        timeCap:
                                            snapshot.data![index].timeCap));
                              });
                        } else if (snapshot.hasError) {
                          return const Text("has error");
                        }
                        return Text("none data");
                      case ConnectionState.waiting:
                        return Center(
                            child: CircularProgressIndicator.adaptive());
                      case ConnectionState.none:
                        return Text("nothing");
                      case ConnectionState.active:
                        // TODO: Handle this case.
                        break;
                    }
                    return Text("nothing");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
