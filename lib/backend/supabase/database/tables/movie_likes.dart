import '../database.dart';

class MovieLikesTable extends SupabaseTable<MovieLikesRow> {
  @override
  String get tableName => 'movie_likes';

  @override
  MovieLikesRow createRow(Map<String, dynamic> data) => MovieLikesRow(data);
}

class MovieLikesRow extends SupabaseDataRow {
  MovieLikesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieLikesTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get movieId => getField<int>('movie_id')!;
  set movieId(int value) => setField<int>('movie_id', value);

  DateTime? get likedAt => getField<DateTime>('liked_at');
  set likedAt(DateTime? value) => setField<DateTime>('liked_at', value);
}
