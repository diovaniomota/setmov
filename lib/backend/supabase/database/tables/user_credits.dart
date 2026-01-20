import '../database.dart';

class UserCreditsTable extends SupabaseTable<UserCreditsRow> {
  @override
  String get tableName => 'user_credits';

  @override
  UserCreditsRow createRow(Map<String, dynamic> data) => UserCreditsRow(data);
}

class UserCreditsRow extends SupabaseDataRow {
  UserCreditsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCreditsTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double? get balance => getField<double>('balance');
  set balance(double? value) => setField<double>('balance', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
