import '../database.dart';

class SchemaMigrationsTable extends SupabaseTable<SchemaMigrationsRow> {
  @override
  String get tableName => 'schema_migrations';

  @override
  SchemaMigrationsRow createRow(Map<String, dynamic> data) =>
      SchemaMigrationsRow(data);
}

class SchemaMigrationsRow extends SupabaseDataRow {
  SchemaMigrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SchemaMigrationsTable();

  int get version => getField<int>('version')!;
  set version(int value) => setField<int>('version', value);

  DateTime? get insertedAt => getField<DateTime>('inserted_at');
  set insertedAt(DateTime? value) => setField<DateTime>('inserted_at', value);
}
