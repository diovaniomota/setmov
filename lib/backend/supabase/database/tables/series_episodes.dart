import '../database.dart';

class SeriesEpisodesTable extends SupabaseTable<SeriesEpisodesRow> {
  @override
  String get tableName => 'series_episodes';

  @override
  SeriesEpisodesRow createRow(Map<String, dynamic> data) =>
      SeriesEpisodesRow(data);
}

class SeriesEpisodesRow extends SupabaseDataRow {
  SeriesEpisodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SeriesEpisodesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  int get seasonNumber => getField<int>('season_number')!;
  set seasonNumber(int value) => setField<int>('season_number', value);

  int get episodeNumber => getField<int>('episode_number')!;
  set episodeNumber(int value) => setField<int>('episode_number', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get streamUrl => getField<String>('stream_url');
  set streamUrl(String? value) => setField<String>('stream_url', value);

  String? get trailerUrl => getField<String>('trailer_url');
  set trailerUrl(String? value) => setField<String>('trailer_url', value);
}
