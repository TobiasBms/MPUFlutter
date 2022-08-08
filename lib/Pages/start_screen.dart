import 'package:cross_fit_app/State/counter.dart';
import 'package:provider/provider.dart';

import '../Theme/Enums/variant.dart';
import 'package:flutter/material.dart';
import '../Widgets/custom_btn.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({Key? key}) : super(key: key);
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).textTheme.button?.color,
        title: const Text("Start screen", style: TextStyle(color: Color(0xffb2b0b2),
            fontSize: 18)),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.ac_unit_outlined))
        ],
      ) ,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                   TmaButton(onChange: context.read<Counter>().increment, label: context.watch<Counter>().count, variant: Variant.outline)
                ],
              )
            ],
          ),
        ),
      ) ,
    );
  }

}