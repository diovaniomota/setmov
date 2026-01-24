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

    String? userId;

    try {
      // 1. Tentar registrar no Supabase Auth
      final AuthResponse authResponse = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      userId = authResponse.user?.id;
    } on AuthException catch (e) {
      if (e.message.contains('already registered') ||
          e.message.contains('already exists')) {
        debugPrint(
            'Usuário já registrado no Auth. Tentando login para completar o cadastro...');
        try {
          final AuthResponse signInResponse =
              await supabase.auth.signInWithPassword(
            email: email,
            password: password,
          );
          userId = signInResponse.user?.id;
        } catch (signInError) {
          debugPrint('Falha ao autenticar usuário existente: $signInError');
          return false;
        }
      } else {
        rethrow;
      }
    }

    if (userId == null) {
      debugPrint('Falha no registro: UID não obtido.');
      return false;
    }

    debugPrint(
        'Usuário identificado. UID: $userId. Garantindo dados no banco...');

    // 2. Tentar inserir ou atualizar os dados na tabela users (upsert)
    // Garantimos que os nomes não sejam vazios para não quebrar a UI
    final String cleanFirstName = firstName.trim();
    final String cleanLastName = (lastName ?? '').trim();

    await supabase.from('users').upsert({
      'id': userId,
      'first_name': cleanFirstName.isEmpty ? 'Usuário' : cleanFirstName,
      'last_name': cleanLastName,
      'email': email,
      'phone': phone,
      'age': calcularIdade(dateOfBirth),
      'date_of_birth': dateOfBirth.toIso8601String(),
    });

    // 3. Inicializar a carteira (wallets) e créditos (user_credits) se não existirem
    // Usamos upsert aqui baseado no user_id para garantir a criação sem duplicar
    try {
      debugPrint('Garantindo inicialização da carteira para $userId...');
      await supabase.from('wallets').upsert({
        'user_id': userId,
        'balance_coins': 0.0,
      }, onConflict: 'user_id');
    } catch (e) {
      debugPrint('Erro ao garantir carteira: $e');
    }

    try {
      debugPrint('Garantindo inicialização de créditos para $userId...');
      await supabase.from('user_credits').upsert({
        'user_id': userId,
        'balance': 0.0,
      }, onConflict: 'user_id');
    } catch (e) {
      debugPrint('Erro ao garantir créditos: $e');
    }

    debugPrint('Fluxo de registro/recuperação concluído com sucesso.');
    return true;
  } on AuthException catch (e) {
    debugPrint('ERRO de AUTENTICAÇÃO no Supabase: ${e.message}');
    return false;
  } on PostgrestException catch (e) {
    debugPrint('ERRO DE BANCO no Supabase (Postgrest): ${e.message}');
    return false;
  } catch (e) {
    debugPrint('ERRO DESCONHECIDO: $e');
    return false;
  }
}
