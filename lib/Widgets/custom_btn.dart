import 'package:flutter/material.dart';
import '../Theme/Enums/variant.dart';

class TmaButton extends StatelessWidget{

  //Properties
  final int label;
  final Function onChange;
  final Variant variant;

  const TmaButton({super.key, required this.onChange, required this.label, required this.variant});

  @override
  Widget build(BuildContext context) {

    return  OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: const BorderSide(color: Colors.amber, width: 1.5)
        ),
          onPressed: () => onChange(),
        child: Text(label.toString()));
  }
}