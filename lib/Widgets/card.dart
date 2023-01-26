import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 8.0,
      color: Colors.white30,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () => {
          debugPrint('card tapped')
        },
        child: const SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: Text("hello world"),
          ),
        ),
      ),
    );
  }
}
