import '../database.dart';

class UserProfileWithCreditsTable
    extends SupabaseTable<UserProfileWithCreditsRow> {
  @override
  String get tableName => 'user_profile_with_credits';

  @override
  UserProfileWithCreditsRow createRow(Map<String, dynamic> data) =>
      UserProfileWithCreditsRow(data);
}

class UserProfileWithCreditsRow extends SupabaseDataRow {
  UserProfileWithCreditsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserProfileWithCreditsTable();

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  DateTime? get createdTime => getField<DateTime>('created_time');
  set createdTime(DateTime? value) => setField<DateTime>('created_time', value);

  String? get imagemPerfil => getField<String>('imagem_perfil');
  set imagemPerfil(String? value) => setField<String>('imagem_perfil', value);

  double? get balance => getField<double>('balance');
  set balance(double? value) => setField<double>('balance', value);
}
