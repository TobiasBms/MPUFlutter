import 'dart:ui';

import 'package:cross_fit_app/Widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class HighlightButtonState extends StatefulWidget {
  const HighlightButtonState({Key? key}) : super(key: key);


  @override
  State<HighlightButtonState> createState() => HighlightButton();

}

class HighlightButton extends State<HighlightButtonState> {

  void onPressed(){
    print("pressed");
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                (Set<MaterialState> states) {
              return const RoundedRectangleBorder(side: BorderSide(color: Colors.white));
          }
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.0); // Use the component's default.
          },
        ),
      ), child: const Icon(Icons.add, color: Colors.white)
    );
  }

}

