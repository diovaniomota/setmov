import '../database.dart';

class ExtensionsTable extends SupabaseTable<ExtensionsRow> {
  @override
  String get tableName => 'extensions';

  @override
  ExtensionsRow createRow(Map<String, dynamic> data) => ExtensionsRow(data);
}

class ExtensionsRow extends SupabaseDataRow {
  ExtensionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExtensionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  dynamic get settings => getField<dynamic>('settings');
  set settings(dynamic value) => setField<dynamic>('settings', value);

  String? get tenantExternalId => getField<String>('tenant_external_id');
  set tenantExternalId(String? value) =>
      setField<String>('tenant_external_id', value);

  DateTime get insertedAt => getField<DateTime>('inserted_at')!;
  set insertedAt(DateTime value) => setField<DateTime>('inserted_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
