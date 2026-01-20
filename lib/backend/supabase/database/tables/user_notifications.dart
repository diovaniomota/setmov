import '../database.dart';

class UserNotificationsTable extends SupabaseTable<UserNotificationsRow> {
  @override
  String get tableName => 'user_notifications';

  @override
  UserNotificationsRow createRow(Map<String, dynamic> data) =>
      UserNotificationsRow(data);
}

class UserNotificationsRow extends SupabaseDataRow {
  UserNotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserNotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
