import '../database.dart';

class UserWatchedMoviesTable extends SupabaseTable<UserWatchedMoviesRow> {
  @override
  String get tableName => 'user_watched_movies';

  @override
  UserWatchedMoviesRow createRow(Map<String, dynamic> data) =>
      UserWatchedMoviesRow(data);
}

class UserWatchedMoviesRow extends SupabaseDataRow {
  UserWatchedMoviesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserWatchedMoviesTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  String? get movieTitle => getField<String>('movie_title');
  set movieTitle(String? value) => setField<String>('movie_title', value);

  String? get coverUrl => getField<String>('cover_url');
  set coverUrl(String? value) => setField<String>('cover_url', value);

  double? get averageRatingGlobal => getField<double>('average_rating_global');
  set averageRatingGlobal(double? value) =>
      setField<double>('average_rating_global', value);

  int? get ratingCount => getField<int>('rating_count');
  set ratingCount(int? value) => setField<int>('rating_count', value);

  int? get userRating => getField<int>('user_rating');
  set userRating(int? value) => setField<int>('user_rating', value);

  DateTime? get watchedAt => getField<DateTime>('watched_at');
  set watchedAt(DateTime? value) => setField<DateTime>('watched_at', value);
}
