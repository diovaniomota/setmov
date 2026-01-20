import '../database.dart';

class FeedFollowersCommentsTable
    extends SupabaseTable<FeedFollowersCommentsRow> {
  @override
  String get tableName => 'feed_followers_comments';

  @override
  FeedFollowersCommentsRow createRow(Map<String, dynamic> data) =>
      FeedFollowersCommentsRow(data);
}

class FeedFollowersCommentsRow extends SupabaseDataRow {
  FeedFollowersCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedFollowersCommentsTable();

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  String? get commentText => getField<String>('comment_text');
  set commentText(String? value) => setField<String>('comment_text', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get authorId => getField<String>('author_id');
  set authorId(String? value) => setField<String>('author_id', value);

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

  String? get followerId => getField<String>('follower_id');
  set followerId(String? value) => setField<String>('follower_id', value);

  String? get followedId => getField<String>('followed_id');
  set followedId(String? value) => setField<String>('followed_id', value);
}
