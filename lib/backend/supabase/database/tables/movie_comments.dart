import '../database.dart';

class MovieCommentsTable extends SupabaseTable<MovieCommentsRow> {
  @override
  String get tableName => 'movie_comments';

  @override
  MovieCommentsRow createRow(Map<String, dynamic> data) =>
      MovieCommentsRow(data);
}

class MovieCommentsRow extends SupabaseDataRow {
  MovieCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieCommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  String get comment => getField<String>('comment')!;
  set comment(String value) => setField<String>('comment', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get rentalId => getField<int>('rental_id');
  set rentalId(int? value) => setField<int>('rental_id', value);
}
