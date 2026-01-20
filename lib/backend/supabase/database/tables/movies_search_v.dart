import '../database.dart';

class MoviesSearchVTable extends SupabaseTable<MoviesSearchVRow> {
  @override
  String get tableName => 'movies_search_v';

  @override
  MoviesSearchVRow createRow(Map<String, dynamic> data) =>
      MoviesSearchVRow(data);
}

class MoviesSearchVRow extends SupabaseDataRow {
  MoviesSearchVRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MoviesSearchVTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get storyline => getField<String>('storyline');
  set storyline(String? value) => setField<String>('storyline', value);

  String? get trailerUrl => getField<String>('trailer_url');
  set trailerUrl(String? value) => setField<String>('trailer_url', value);

  String? get ageRating => getField<String>('age_rating');
  set ageRating(String? value) => setField<String>('age_rating', value);

  double? get rentalPrice => getField<double>('rental_price');
  set rentalPrice(double? value) => setField<double>('rental_price', value);

  String? get streamUrl => getField<String>('stream_url');
  set streamUrl(String? value) => setField<String>('stream_url', value);

  String? get coverUrl => getField<String>('cover_url');
  set coverUrl(String? value) => setField<String>('cover_url', value);

  bool? get isSeries => getField<bool>('is_series');
  set isSeries(bool? value) => setField<bool>('is_series', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get releaseYear => getField<int>('release_year');
  set releaseYear(int? value) => setField<int>('release_year', value);

  double? get avgRating => getField<double>('avg_rating');
  set avgRating(double? value) => setField<double>('avg_rating', value);

  int? get ratingCount => getField<int>('rating_count');
  set ratingCount(int? value) => setField<int>('rating_count', value);

  String? get titleUnaccent => getField<String>('title_unaccent');
  set titleUnaccent(String? value) => setField<String>('title_unaccent', value);

  String? get titleNorm => getField<String>('title_norm');
  set titleNorm(String? value) => setField<String>('title_norm', value);
}
