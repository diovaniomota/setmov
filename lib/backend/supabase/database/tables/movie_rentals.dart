import '../database.dart';

class MovieRentalsTable extends SupabaseTable<MovieRentalsRow> {
  @override
  String get tableName => 'movie_rentals';

  @override
  MovieRentalsRow createRow(Map<String, dynamic> data) => MovieRentalsRow(data);
}

class MovieRentalsRow extends SupabaseDataRow {
  MovieRentalsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovieRentalsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  DateTime? get rentedAt => getField<DateTime>('rented_at');
  set rentedAt(DateTime? value) => setField<DateTime>('rented_at', value);

  DateTime get expiresAt => getField<DateTime>('expires_at')!;
  set expiresAt(DateTime value) => setField<DateTime>('expires_at', value);
}
