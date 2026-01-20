import '../database.dart';

class ViewMyCommentsTable extends SupabaseTable<ViewMyCommentsRow> {
  @override
  String get tableName => 'view_my_comments';

  @override
  ViewMyCommentsRow createRow(Map<String, dynamic> data) =>
      ViewMyCommentsRow(data);
}

class ViewMyCommentsRow extends SupabaseDataRow {
  ViewMyCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewMyCommentsTable();

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  String? get commentText => getField<String>('comment_text');
  set commentText(String? value) => setField<String>('comment_text', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  String? get movieTitle => getField<String>('movie_title');
  set movieTitle(String? value) => setField<String>('movie_title', value);

  String? get movieCover => getField<String>('movie_cover');
  set movieCover(String? value) => setField<String>('movie_cover', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);
}
