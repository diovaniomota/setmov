// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// End automatic FlutterFlow imports

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> signInWithSupabase(
  String email,
  String password,
) async {
  final SupabaseClient supabase = Supabase.instance.client;

  try {
    // Tenta fazer o login com e-mail e senha
    final AuthResponse authResponse = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    // Se a resposta do usuário for nula, o login falhou.
    if (authResponse.user == null) {
      debugPrint('Falha no login: Usuário nulo');
      return false;
    }

    debugPrint('Login bem-sucedido para o e-mail: $email');
    return true; // Sucesso
  } on AuthException catch (e) {
    // Captura erros de autenticação (e-mail/senha incorretos)
    debugPrint('Erro de autenticação: ${e.message}');
    return false; // Falha no login
  } catch (e) {
    // Captura qualquer outro erro
    debugPrint('Erro desconhecido durante o login: $e');
    return false; // Falha
  }
}
