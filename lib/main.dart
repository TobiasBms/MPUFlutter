import 'package:cross_fit_app/Pages/account_page.dart';
import 'package:cross_fit_app/Pages/workouts_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Pages/login_page.dart';
import 'Pages/splash_page.dart';
import 'constants.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: Constants.supabaseUrl, anonKey: Constants.supabaseAnnonKey);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool loading;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        backgroundColor: Colors.greenAccent,
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 64.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F141B)),
            bodySmall: TextStyle(fontSize: 12.0),
            bodyMedium: TextStyle(
              fontSize: 16.0,
            ),
            bodyLarge: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            )),
        scaffoldBackgroundColor: Colors.amber,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.green),
        ),
      ),
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (_) => const SplashPage(),
        '/account': (_) => const AccountPage(),
        '/workouts': (_) => const WorkoutsPage(),
        '/login': (_) => const LoginPage(),
      },
    );
  }
}
