import '../database.dart';

class ViewUserFollowingWithAvatarByIdTable
    extends SupabaseTable<ViewUserFollowingWithAvatarByIdRow> {
  @override
  String get tableName => 'view_user_following_with_avatar_by_id';

  @override
  ViewUserFollowingWithAvatarByIdRow createRow(Map<String, dynamic> data) =>
      ViewUserFollowingWithAvatarByIdRow(data);
}

class ViewUserFollowingWithAvatarByIdRow extends SupabaseDataRow {
  ViewUserFollowingWithAvatarByIdRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserFollowingWithAvatarByIdTable();

  String? get followerId => getField<String>('follower_id');
  set followerId(String? value) => setField<String>('follower_id', value);

  String? get followedId => getField<String>('followed_id');
  set followedId(String? value) => setField<String>('followed_id', value);

  DateTime? get followedAt => getField<DateTime>('followed_at');
  set followedAt(DateTime? value) => setField<DateTime>('followed_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get imagemPerfil => getField<String>('imagem_perfil');
  set imagemPerfil(String? value) => setField<String>('imagem_perfil', value);
}
