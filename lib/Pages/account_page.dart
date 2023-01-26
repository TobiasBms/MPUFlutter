import 'dart:async';
import 'package:cross_fit_app/Theme/Enums/variant.dart';
import 'package:cross_fit_app/Widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:cross_fit_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountState();
}

class _AccountState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _fullname = TextEditingController();
  late final StreamSubscription<AuthState> _authStreamSubscription;

  bool _loading = false;
  bool _loggedIn = false;

  @override
  void initState() {
    final userId = supabase.auth.currentUser?.id;

    if (userId != null) {
      _loggedIn = true;
    }
    getUserProfile();
    super.initState();
  }

  Future<void> getUserProfile() async {
    setState(() {
      _loading = true;
    });
    final userId = supabase.auth.currentUser?.id;
    if (userId != null) {
      setState(() {
        _loggedIn = true;
      });
    }
    try {
      final data = await supabase
          .from("profiles")
          .select()
          .eq("id", userId)
          .single() as Map;

      _usernameController.text = (data['username'] ?? '') as String;
      _fullname.text = (data['full_name'] ?? '') as String;
    } on PostgrestException catch (error) {
      context.showSnackbar(message: error.message);
    } catch (error) {
      context.showErrorSnackbar(message: "Unexcepted error");
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> signOut() async {
    setState(() {
      _loading = true;
    });
    try {
      await supabase.auth.signOut();
      if (mounted) {
        Navigator.of(context).pushReplacementNamed("/login");
        context.showSnackbar(message: "You are now logged out");
      }
    } on AuthException catch (error) {
      context.showSnackbar(message: error.message);
    } catch (error) {
      context.showErrorSnackbar(message: "Something went wrong try again");
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> updateUser() async {
    setState(() {
      _loading = true;
    });
    final user = supabase.auth.currentUser;
    final data = {
      'id': user!.id,
      'username': _usernameController.text,
      'full_name': _fullname.text,
      'updated_at': DateTime.now().toIso8601String(),
    };
    try {
      await supabase.from('profiles').update(data);
      if (mounted) {
        context.showSnackbar(message: "User now updated");
      }
    } on PostgrestException catch (error) {
      context.showSnackbar(message: error.message);
    } catch (error) {
      context.showErrorSnackbar(message: "Unexpected error occurred");
    }
  }

  @override
  void dispose() {
    _authStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.person),
            title: const Text("Your profile"),
            actions: [
              IconButton(
                  onPressed: signOut,
                  icon: _loggedIn
                      ? const Icon(Icons.logout)
                      : const Icon(Icons.settings))
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome ${_usernameController.text}',
                  style: Theme.of(context).textTheme.headline1),
              Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(focusColor: Colors.lime),
                  ),
                  TextFormField(
                    controller: _fullname,
                    decoration:
                        const InputDecoration(border: UnderlineInputBorder()),
                  )
                ],
              ),
              Row(children: [
                TmaButton(
                    onClick: updateUser,
                    label: "Update user",
                    variant: Variant.outline),
                TmaButton(
                    onClick: updateUser,
                    label: "Delete user",
                    variant: Variant.outline)
              ])
            ],
          ),
        ));
  }
}
