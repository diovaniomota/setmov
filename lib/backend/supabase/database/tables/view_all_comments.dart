import '../database.dart';

class ViewAllCommentsTable extends SupabaseTable<ViewAllCommentsRow> {
  @override
  String get tableName => 'view_all_comments';

  @override
  ViewAllCommentsRow createRow(Map<String, dynamic> data) =>
      ViewAllCommentsRow(data);
}

class ViewAllCommentsRow extends SupabaseDataRow {
  ViewAllCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewAllCommentsTable();

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

  bool? get userLiked => getField<bool>('user_liked');
  set userLiked(bool? value) => setField<bool>('user_liked', value);
}
