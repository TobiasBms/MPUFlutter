import 'package:cross_fit_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Models/user.dart';

class AuthService  {
 late SupabaseClient supabaseAuth;

 static dynamic _instance;

 static SupabaseClient client = supabase;

  //Singleton pattern
 factory AuthService._() => _instance ??= AuthService._();

  Future<String> signInWithPassword(UserRequest user) async{
    try{
      await client.auth.signInWithPassword(password: user.hashedPassword);
      return "signed In";
    }on PostgrestException catch(error){
        return error.message;
    }catch(error) {
        return "error";
    }
  }

}