import '../database.dart';

class UserFavoriteMoviesTable extends SupabaseTable<UserFavoriteMoviesRow> {
  @override
  String get tableName => 'user_favorite_movies';

  @override
  UserFavoriteMoviesRow createRow(Map<String, dynamic> data) =>
      UserFavoriteMoviesRow(data);
}

class UserFavoriteMoviesRow extends SupabaseDataRow {
  UserFavoriteMoviesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoriteMoviesTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get imagemPerfil => getField<String>('imagem_perfil');
  set imagemPerfil(String? value) => setField<String>('imagem_perfil', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  String? get movieTitle => getField<String>('movie_title');
  set movieTitle(String? value) => setField<String>('movie_title', value);

  String? get coverUrl => getField<String>('cover_url');
  set coverUrl(String? value) => setField<String>('cover_url', value);

  double? get averageRatingGlobal => getField<double>('average_rating_global');
  set averageRatingGlobal(double? value) =>
      setField<double>('average_rating_global', value);

  int? get userRating => getField<int>('user_rating');
  set userRating(int? value) => setField<int>('user_rating', value);

  DateTime? get favoritedAt => getField<DateTime>('favorited_at');
  set favoritedAt(DateTime? value) => setField<DateTime>('favorited_at', value);
}
