import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

extension ShowSnackbar on BuildContext{
  void showSnackbar({
    required String message,
    Color backgroundColor = Colors.white,
  }){
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message),
    backgroundColor: backgroundColor
    ));
  }

  void showErrorSnackbar({
  required String message
}){
    showSnackbar(message: message, backgroundColor: Colors.red);
  }


}