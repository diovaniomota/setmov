import '../database.dart';

class MovieCategoriesTable extends SupabaseTable<MovieCategoriesRow> {
  @override
  String get tableName => 'movie_categories';

  @override
  MovieCategoriesRow createRow(Map<String, dynamic> data) =>
      MovieCategoriesRow(data);
}

class MovieCategoriesRow extends SupabaseDataRow {
  MovieCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieCategoriesTable();

  int get movieId => getField<int>('movie_id')!;
  set movieId(int value) => setField<int>('movie_id', value);

  int get categoryId => getField<int>('category_id')!;
  set categoryId(int value) => setField<int>('category_id', value);
}
