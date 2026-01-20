import '../database.dart';

class UserCardsTable extends SupabaseTable<UserCardsRow> {
  @override
  String get tableName => 'user_cards';

  @override
  UserCardsRow createRow(Map<String, dynamic> data) => UserCardsRow(data);
}

class UserCardsRow extends SupabaseDataRow {
  UserCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get cardToken => getField<String>('card_token')!;
  set cardToken(String value) => setField<String>('card_token', value);

  String? get last4 => getField<String>('last4');
  set last4(String? value) => setField<String>('last4', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  DateTime? get expiryDate => getField<DateTime>('expiry_date');
  set expiryDate(DateTime? value) => setField<DateTime>('expiry_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
