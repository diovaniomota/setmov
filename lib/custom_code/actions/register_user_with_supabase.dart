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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> registerUserWithSupabase(
  String email,
  String password,
  String firstName,
  String? lastName,
  String? phone,
  DateTime dateOfBirth,
) async {
  final SupabaseClient supabase = Supabase.instance.client;

  try {
    debugPrint('Iniciando o registro com o email: $email');

    // 1. Tentar registrar no Supabase Auth
    final AuthResponse authResponse = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    // 2. Verificar o resultado do registro de autenticação
    if (authResponse.user == null) {
      debugPrint(
          'Falha no registro de autenticação: o usuário retornado é nulo.');
      // Verifique as possíveis razões: email já registrado, senha muito curta.
      return false;
    }

    final String userId = authResponse.user!.id;
    debugPrint('Usuário autenticado com sucesso. UID: $userId');

    // 3. Tentar inserir os dados na tabela users
    debugPrint('Tentando inserir dados na tabela users...');
    await supabase.from('users').insert({
      'id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'age': calcularIdade(dateOfBirth),
      'date_of_birth': dateOfBirth,
    });

    debugPrint('Dados do usuário persistidos com sucesso na tabela users.');
    return true; // Sucesso
  } on AuthException catch (e) {
    debugPrint('ERRO de AUTENTICAÇÃO no Supabase: ${e.message}');
    return false; // Falha na autenticação
  } on PostgrestException catch (e) {
    // Este erro agora seria de dados, se houver.
    debugPrint('ERRO DE INSERÇÃO no Supabase (Postgrest): ${e.message}');
    debugPrint('Código do erro: ${e.code}');
    return false; // Falha na inserção
  } catch (e) {
    debugPrint('ERRO DESCONHECIDO: $e');
    return false; // Falha geral
  }
}
