import '../database.dart';

class BlsTable extends SupabaseTable<BlsRow> {
  @override
  String get tableName => 'bls';

  @override
  BlsRow createRow(Map<String, dynamic> data) => BlsRow(data);
}

class BlsRow extends SupabaseDataRow {
  BlsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get numero => getField<String>('numero')!;
  set numero(String value) => setField<String>('numero', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
