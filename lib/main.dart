import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'State/counter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TMA CrossFit",
      theme: ThemeData(
        textTheme: const TextTheme(
          button: TextStyle(
            color: Color(0xbb13090B),
          )
        ),
        primarySwatch: Colors.blueGrey,
        colorScheme: const ColorScheme.dark()
      ),
      home: const StartScreen(),
    );
  }
}
