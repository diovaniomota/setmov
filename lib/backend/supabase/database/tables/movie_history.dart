import '../database.dart';

class MovieHistoryTable extends SupabaseTable<MovieHistoryRow> {
  @override
  String get tableName => 'movie_history';

  @override
  MovieHistoryRow createRow(Map<String, dynamic> data) => MovieHistoryRow(data);
}

class MovieHistoryRow extends SupabaseDataRow {
  MovieHistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieHistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  DateTime? get watchedAt => getField<DateTime>('watched_at');
  set watchedAt(DateTime? value) => setField<DateTime>('watched_at', value);

  int? get watchedDuration => getField<int>('watched_duration');
  set watchedDuration(int? value) => setField<int>('watched_duration', value);

  int? get totalDuration => getField<int>('total_duration');
  set totalDuration(int? value) => setField<int>('total_duration', value);
}
