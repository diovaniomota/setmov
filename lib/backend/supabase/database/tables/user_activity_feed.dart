import '../database.dart';

class UserActivityFeedTable extends SupabaseTable<UserActivityFeedRow> {
  @override
  String get tableName => 'user_activity_feed';

  @override
  UserActivityFeedRow createRow(Map<String, dynamic> data) =>
      UserActivityFeedRow(data);
}

class UserActivityFeedRow extends SupabaseDataRow {
  UserActivityFeedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserActivityFeedTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get actionType => getField<String>('action_type');
  set actionType(String? value) => setField<String>('action_type', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
