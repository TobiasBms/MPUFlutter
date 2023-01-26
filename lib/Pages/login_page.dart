import 'dart:async';
import 'package:cross_fit_app/Theme/Enums/variant.dart';
import 'package:cross_fit_app/Widgets/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cross_fit_app/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final StreamSubscription<AuthState> _authStateSubscription;
  String dropdownItem = "1";

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await supabase.auth.signUp(
          password: _passwordController.text, email: _emailController.text);
      if (mounted) {
        context.showSnackbar(message: "you are now logged in");
        _emailController.clear();
        _passwordController.clear();
      }
    } on AuthException catch (error) {
      context.showErrorSnackbar(message: error.message);
    } catch (error) {
      context.showErrorSnackbar(message: "Something went wrong not sure what ");
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithPassword(
          password: _passwordController.text, email: _emailController.text);

      if (mounted) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/account');
      }
    } on AuthException catch (error) {
      context.showErrorSnackbar(message: error.message);
    } catch (error) {
      context.showErrorSnackbar(message: 'Unexpected error occurred');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _isLoading = true;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/account');
      }
    });
    _isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                    color: Colors.limeAccent, strokeWidth: 2.0))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.login_outlined),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Sign in'),
                              ),
                              Text(
                                "with email and password",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please provide info";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TmaButton(
                        onClick: () => {
                              ScaffoldMessenger.of(context).clearSnackBars(),
                              _signIn()
                            },
                        label: 'Login',
                        variant: Variant.outline),
                    TmaButton(
                        onClick: () => {
                              ScaffoldMessenger.of(context).clearSnackBars(),
                              _signUp()
                            },
                        label: 'Sign up ',
                        variant: Variant.outline),
                    TmaButton(
                        onClick: () =>
                            {Navigator.of(context).pushNamed("/workouts")},
                        label: 'Go to workouts',
                        variant: Variant.outline),
                  ],
                ),
              ),
      ),
    );
  }
}
