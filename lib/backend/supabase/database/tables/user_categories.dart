import '../database.dart';

class UserCategoriesTable extends SupabaseTable<UserCategoriesRow> {
  @override
  String get tableName => 'user_categories';

  @override
  UserCategoriesRow createRow(Map<String, dynamic> data) =>
      UserCategoriesRow(data);
}

class UserCategoriesRow extends SupabaseDataRow {
  UserCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCategoriesTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get categoryId => getField<int>('category_id')!;
  set categoryId(int value) => setField<int>('category_id', value);
}
