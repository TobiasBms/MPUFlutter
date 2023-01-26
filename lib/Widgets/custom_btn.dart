import 'package:flutter/material.dart';
import '../Theme/Enums/variant.dart';

class TmaButton extends StatelessWidget{

  //Properties
  final String label;
  final VoidCallback? onClick;
  final Variant variant;

  const TmaButton({super.key, required this.onClick, required this.label, required this.variant});

  @override
  Widget build(BuildContext context) {

    return  variant == Variant.outline ? OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white, side: const BorderSide(color: Colors.amber, width: 1.5)
        ),
          onPressed: onClick,
        child: Text(label)) : ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, side: const BorderSide(color: Colors.amber, width: 1.5)
        ),
        onPressed: onClick,
        child: Text(label));
  }
}