import '../database.dart';

class ViewUserFollowsWithAvatarTable
    extends SupabaseTable<ViewUserFollowsWithAvatarRow> {
  @override
  String get tableName => 'view_user_follows_with_avatar';

  @override
  ViewUserFollowsWithAvatarRow createRow(Map<String, dynamic> data) =>
      ViewUserFollowsWithAvatarRow(data);
}

class ViewUserFollowsWithAvatarRow extends SupabaseDataRow {
  ViewUserFollowsWithAvatarRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserFollowsWithAvatarTable();

  String? get followerId => getField<String>('follower_id');
  set followerId(String? value) => setField<String>('follower_id', value);

  String? get followedId => getField<String>('followed_id');
  set followedId(String? value) => setField<String>('followed_id', value);

  DateTime? get followedAt => getField<DateTime>('followed_at');
  set followedAt(DateTime? value) => setField<DateTime>('followed_at', value);

  String? get imagemPerfil => getField<String>('imagem_perfil');
  set imagemPerfil(String? value) => setField<String>('imagem_perfil', value);
}
