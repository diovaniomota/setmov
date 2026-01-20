import '../database.dart';

class MovieRatingsTable extends SupabaseTable<MovieRatingsRow> {
  @override
  String get tableName => 'movie_ratings';

  @override
  MovieRatingsRow createRow(Map<String, dynamic> data) => MovieRatingsRow(data);
}

class MovieRatingsRow extends SupabaseDataRow {
  MovieRatingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieRatingsTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get movieId => getField<int>('movie_id')!;
  set movieId(int value) => setField<int>('movie_id', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  DateTime? get ratedAt => getField<DateTime>('rated_at');
  set ratedAt(DateTime? value) => setField<DateTime>('rated_at', value);
}
