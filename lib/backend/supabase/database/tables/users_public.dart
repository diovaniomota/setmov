import '../database.dart';

class UsersPublicTable extends SupabaseTable<UsersPublicRow> {
  @override
  String get tableName => 'users_public';

  @override
  UsersPublicRow createRow(Map<String, dynamic> data) => UsersPublicRow(data);
}

class UsersPublicRow extends SupabaseDataRow {
  UsersPublicRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersPublicTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  String? get dateOfBirth => getField<String>('date_of_birth');
  set dateOfBirth(String? value) => setField<String>('date_of_birth', value);

  String? get imagemPerfil => getField<String>('imagem_perfil');
  set imagemPerfil(String? value) => setField<String>('imagem_perfil', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
