import '../database.dart';

class ViewUserCommentsByIdTable extends SupabaseTable<ViewUserCommentsByIdRow> {
  @override
  String get tableName => 'view_user_comments_by_id';

  @override
  ViewUserCommentsByIdRow createRow(Map<String, dynamic> data) =>
      ViewUserCommentsByIdRow(data);
}

class ViewUserCommentsByIdRow extends SupabaseDataRow {
  ViewUserCommentsByIdRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserCommentsByIdTable();

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  String? get commentText => getField<String>('comment_text');
  set commentText(String? value) => setField<String>('comment_text', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get authorAvatar => getField<String>('author_avatar');
  set authorAvatar(String? value) => setField<String>('author_avatar', value);

  String? get movieTitle => getField<String>('movie_title');
  set movieTitle(String? value) => setField<String>('movie_title', value);

  String? get movieCover => getField<String>('movie_cover');
  set movieCover(String? value) => setField<String>('movie_cover', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);
}
