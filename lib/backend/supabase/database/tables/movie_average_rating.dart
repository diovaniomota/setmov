import '../database.dart';

class MovieAverageRatingTable extends SupabaseTable<MovieAverageRatingRow> {
  @override
  String get tableName => 'movie_average_rating';

  @override
  MovieAverageRatingRow createRow(Map<String, dynamic> data) =>
      MovieAverageRatingRow(data);
}

class MovieAverageRatingRow extends SupabaseDataRow {
  MovieAverageRatingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieAverageRatingTable();

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);
}
