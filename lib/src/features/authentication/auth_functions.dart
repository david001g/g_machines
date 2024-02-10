import 'package:flutter_login/flutter_login.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/create_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> onSignup(SignupData signUpData) async {
  try{
    final supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth.signUp(
      email: signUpData.name,
      password: signUpData.password!,
    );
    //final Session? session = res.session;
    final User? user = res.user;

    ProfileEntity profile = ProfileEntity(
      full_name: signUpData.additionalSignupData!['full_name'],
      username: signUpData.additionalSignupData!['username'],
      avatar_url: signUpData.additionalSignupData!['avatar_url'],
    );

    await supabase.from('profiles').update({
      'username': profile.username,
      'full_name': profile.full_name,
      'avatar_url': profile.avatar_url,
    }).match({'id': res.user!.id});
    return null;
  }
  catch(e){
    print(e);
    return "onSignUp: $e";
  }
}

Future<String?> onLogin(LoginData loginData) async {
  try{
    final supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: loginData.name,
      password: loginData.password,
    );
    //final Session? session = res.session;
    //final User? user = res.user;
    return null;
  }
  catch(e){
    print(e);
    return "onLogin: $e";
  }
}