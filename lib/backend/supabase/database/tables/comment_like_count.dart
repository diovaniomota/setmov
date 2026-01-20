import '../database.dart';

class CommentLikeCountTable extends SupabaseTable<CommentLikeCountRow> {
  @override
  String get tableName => 'comment_like_count';

  @override
  CommentLikeCountRow createRow(Map<String, dynamic> data) =>
      CommentLikeCountRow(data);
}

class CommentLikeCountRow extends SupabaseDataRow {
  CommentLikeCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentLikeCountTable();

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  String? get commentText => getField<String>('comment_text');
  set commentText(String? value) => setField<String>('comment_text', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  String? get authorId => getField<String>('author_id');
  set authorId(String? value) => setField<String>('author_id', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);
}
