import '../database.dart';

class TenantsTable extends SupabaseTable<TenantsRow> {
  @override
  String get tableName => 'tenants';

  @override
  TenantsRow createRow(Map<String, dynamic> data) => TenantsRow(data);
}

class TenantsRow extends SupabaseDataRow {
  TenantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TenantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get externalId => getField<String>('external_id');
  set externalId(String? value) => setField<String>('external_id', value);

  String? get jwtSecret => getField<String>('jwt_secret');
  set jwtSecret(String? value) => setField<String>('jwt_secret', value);

  int get maxConcurrentUsers => getField<int>('max_concurrent_users')!;
  set maxConcurrentUsers(int value) =>
      setField<int>('max_concurrent_users', value);

  DateTime get insertedAt => getField<DateTime>('inserted_at')!;
  set insertedAt(DateTime value) => setField<DateTime>('inserted_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int get maxEventsPerSecond => getField<int>('max_events_per_second')!;
  set maxEventsPerSecond(int value) =>
      setField<int>('max_events_per_second', value);

  String? get postgresCdcDefault => getField<String>('postgres_cdc_default');
  set postgresCdcDefault(String? value) =>
      setField<String>('postgres_cdc_default', value);

  int get maxBytesPerSecond => getField<int>('max_bytes_per_second')!;
  set maxBytesPerSecond(int value) =>
      setField<int>('max_bytes_per_second', value);

  int get maxChannelsPerClient => getField<int>('max_channels_per_client')!;
  set maxChannelsPerClient(int value) =>
      setField<int>('max_channels_per_client', value);

  int get maxJoinsPerSecond => getField<int>('max_joins_per_second')!;
  set maxJoinsPerSecond(int value) =>
      setField<int>('max_joins_per_second', value);

  bool? get suspend => getField<bool>('suspend');
  set suspend(bool? value) => setField<bool>('suspend', value);

  dynamic get jwtJwks => getField<dynamic>('jwt_jwks');
  set jwtJwks(dynamic value) => setField<dynamic>('jwt_jwks', value);

  bool? get notifyPrivateAlpha => getField<bool>('notify_private_alpha');
  set notifyPrivateAlpha(bool? value) =>
      setField<bool>('notify_private_alpha', value);

  bool get privateOnly => getField<bool>('private_only')!;
  set privateOnly(bool value) => setField<bool>('private_only', value);
}
