import '../database.dart';

class UserFollowsTable extends SupabaseTable<UserFollowsRow> {
  @override
  String get tableName => 'user_follows';

  @override
  UserFollowsRow createRow(Map<String, dynamic> data) => UserFollowsRow(data);
}

class UserFollowsRow extends SupabaseDataRow {
  UserFollowsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFollowsTable();

  String get followerId => getField<String>('follower_id')!;
  set followerId(String value) => setField<String>('follower_id', value);

  String get followedId => getField<String>('followed_id')!;
  set followedId(String value) => setField<String>('followed_id', value);

  DateTime? get followedAt => getField<DateTime>('followed_at');
  set followedAt(DateTime? value) => setField<DateTime>('followed_at', value);
}
