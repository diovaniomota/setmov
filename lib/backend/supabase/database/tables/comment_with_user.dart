import '../database.dart';

class CommentWithUserTable extends SupabaseTable<CommentWithUserRow> {
  @override
  String get tableName => 'comment_with_user';

  @override
  CommentWithUserRow createRow(Map<String, dynamic> data) =>
      CommentWithUserRow(data);
}

class CommentWithUserRow extends SupabaseDataRow {
  CommentWithUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentWithUserTable();

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get imagemPerfil => getField<String>('imagem_perfil');
  set imagemPerfil(String? value) => setField<String>('imagem_perfil', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);
}
