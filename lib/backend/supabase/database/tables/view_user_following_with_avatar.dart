import '../database.dart';

class ViewUserFollowingWithAvatarTable
    extends SupabaseTable<ViewUserFollowingWithAvatarRow> {
  @override
  String get tableName => 'view_user_following_with_avatar';

  @override
  ViewUserFollowingWithAvatarRow createRow(Map<String, dynamic> data) =>
      ViewUserFollowingWithAvatarRow(data);
}

class ViewUserFollowingWithAvatarRow extends SupabaseDataRow {
  ViewUserFollowingWithAvatarRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserFollowingWithAvatarTable();

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
