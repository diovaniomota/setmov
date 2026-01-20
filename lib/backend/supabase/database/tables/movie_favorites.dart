import '../database.dart';

class MovieFavoritesTable extends SupabaseTable<MovieFavoritesRow> {
  @override
  String get tableName => 'movie_favorites';

  @override
  MovieFavoritesRow createRow(Map<String, dynamic> data) =>
      MovieFavoritesRow(data);
}

class MovieFavoritesRow extends SupabaseDataRow {
  MovieFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieFavoritesTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get movieId => getField<int>('movie_id')!;
  set movieId(int value) => setField<int>('movie_id', value);

  DateTime? get favoritedAt => getField<DateTime>('favorited_at');
  set favoritedAt(DateTime? value) => setField<DateTime>('favorited_at', value);
}
