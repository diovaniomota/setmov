// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovieStruct extends BaseStruct {
  MovieStruct({
    int? id,
    String? title,
    String? description,
    String? storyline,
    String? trailerUrl,
    String? ageRating,
    int? rentalPrice,
    String? streamUrl,
    String? coverUrl,
    bool? isSeries,
    String? createdAt,
    int? releaseYear,
    double? avgRating,
    int? ratingCount,
    String? titleUnaccent,
  })  : _id = id,
        _title = title,
        _description = description,
        _storyline = storyline,
        _trailerUrl = trailerUrl,
        _ageRating = ageRating,
        _rentalPrice = rentalPrice,
        _streamUrl = streamUrl,
        _coverUrl = coverUrl,
        _isSeries = isSeries,
        _createdAt = createdAt,
        _releaseYear = releaseYear,
        _avgRating = avgRating,
        _ratingCount = ratingCount,
        _titleUnaccent = titleUnaccent;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "storyline" field.
  String? _storyline;
  String get storyline => _storyline ?? '';
  set storyline(String? val) => _storyline = val;

  bool hasStoryline() => _storyline != null;

  // "trailer_url" field.
  String? _trailerUrl;
  String get trailerUrl => _trailerUrl ?? '';
  set trailerUrl(String? val) => _trailerUrl = val;

  bool hasTrailerUrl() => _trailerUrl != null;

  // "age_rating" field.
  String? _ageRating;
  String get ageRating => _ageRating ?? '';
  set ageRating(String? val) => _ageRating = val;

  bool hasAgeRating() => _ageRating != null;

  // "rental_price" field.
  int? _rentalPrice;
  int get rentalPrice => _rentalPrice ?? 0;
  set rentalPrice(int? val) => _rentalPrice = val;

  void incrementRentalPrice(int amount) => rentalPrice = rentalPrice + amount;

  bool hasRentalPrice() => _rentalPrice != null;

  // "stream_url" field.
  String? _streamUrl;
  String get streamUrl => _streamUrl ?? '';
  set streamUrl(String? val) => _streamUrl = val;

  bool hasStreamUrl() => _streamUrl != null;

  // "cover_url" field.
  String? _coverUrl;
  String get coverUrl => _coverUrl ?? '';
  set coverUrl(String? val) => _coverUrl = val;

  bool hasCoverUrl() => _coverUrl != null;

  // "is_series" field.
  bool? _isSeries;
  bool get isSeries => _isSeries ?? false;
  set isSeries(bool? val) => _isSeries = val;

  bool hasIsSeries() => _isSeries != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "release_year" field.
  int? _releaseYear;
  int get releaseYear => _releaseYear ?? 0;
  set releaseYear(int? val) => _releaseYear = val;

  void incrementReleaseYear(int amount) => releaseYear = releaseYear + amount;

  bool hasReleaseYear() => _releaseYear != null;

  // "avg_rating" field.
  double? _avgRating;
  double get avgRating => _avgRating ?? 0.0;
  set avgRating(double? val) => _avgRating = val;

  void incrementAvgRating(double amount) => avgRating = avgRating + amount;

  bool hasAvgRating() => _avgRating != null;

  // "rating_count" field.
  int? _ratingCount;
  int get ratingCount => _ratingCount ?? 0;
  set ratingCount(int? val) => _ratingCount = val;

  void incrementRatingCount(int amount) => ratingCount = ratingCount + amount;

  bool hasRatingCount() => _ratingCount != null;

  // "title_unaccent" field.
  String? _titleUnaccent;
  String get titleUnaccent => _titleUnaccent ?? '';
  set titleUnaccent(String? val) => _titleUnaccent = val;

  bool hasTitleUnaccent() => _titleUnaccent != null;

  static MovieStruct fromMap(Map<String, dynamic> data) => MovieStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        description: data['description'] as String?,
        storyline: data['storyline'] as String?,
        trailerUrl: data['trailer_url'] as String?,
        ageRating: data['age_rating'] as String?,
        rentalPrice: castToType<int>(data['rental_price']),
        streamUrl: data['stream_url'] as String?,
        coverUrl: data['cover_url'] as String?,
        isSeries: data['is_series'] as bool?,
        createdAt: data['created_at'] as String?,
        releaseYear: castToType<int>(data['release_year']),
        avgRating: castToType<double>(data['avg_rating']),
        ratingCount: castToType<int>(data['rating_count']),
        titleUnaccent: data['title_unaccent'] as String?,
      );

  static MovieStruct? maybeFromMap(dynamic data) =>
      data is Map ? MovieStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'description': _description,
        'storyline': _storyline,
        'trailer_url': _trailerUrl,
        'age_rating': _ageRating,
        'rental_price': _rentalPrice,
        'stream_url': _streamUrl,
        'cover_url': _coverUrl,
        'is_series': _isSeries,
        'created_at': _createdAt,
        'release_year': _releaseYear,
        'avg_rating': _avgRating,
        'rating_count': _ratingCount,
        'title_unaccent': _titleUnaccent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'storyline': serializeParam(
          _storyline,
          ParamType.String,
        ),
        'trailer_url': serializeParam(
          _trailerUrl,
          ParamType.String,
        ),
        'age_rating': serializeParam(
          _ageRating,
          ParamType.String,
        ),
        'rental_price': serializeParam(
          _rentalPrice,
          ParamType.int,
        ),
        'stream_url': serializeParam(
          _streamUrl,
          ParamType.String,
        ),
        'cover_url': serializeParam(
          _coverUrl,
          ParamType.String,
        ),
        'is_series': serializeParam(
          _isSeries,
          ParamType.bool,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'release_year': serializeParam(
          _releaseYear,
          ParamType.int,
        ),
        'avg_rating': serializeParam(
          _avgRating,
          ParamType.double,
        ),
        'rating_count': serializeParam(
          _ratingCount,
          ParamType.int,
        ),
        'title_unaccent': serializeParam(
          _titleUnaccent,
          ParamType.String,
        ),
      }.withoutNulls;

  static MovieStruct fromSerializableMap(Map<String, dynamic> data) =>
      MovieStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        storyline: deserializeParam(
          data['storyline'],
          ParamType.String,
          false,
        ),
        trailerUrl: deserializeParam(
          data['trailer_url'],
          ParamType.String,
          false,
        ),
        ageRating: deserializeParam(
          data['age_rating'],
          ParamType.String,
          false,
        ),
        rentalPrice: deserializeParam(
          data['rental_price'],
          ParamType.int,
          false,
        ),
        streamUrl: deserializeParam(
          data['stream_url'],
          ParamType.String,
          false,
        ),
        coverUrl: deserializeParam(
          data['cover_url'],
          ParamType.String,
          false,
        ),
        isSeries: deserializeParam(
          data['is_series'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        releaseYear: deserializeParam(
          data['release_year'],
          ParamType.int,
          false,
        ),
        avgRating: deserializeParam(
          data['avg_rating'],
          ParamType.double,
          false,
        ),
        ratingCount: deserializeParam(
          data['rating_count'],
          ParamType.int,
          false,
        ),
        titleUnaccent: deserializeParam(
          data['title_unaccent'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MovieStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MovieStruct &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        storyline == other.storyline &&
        trailerUrl == other.trailerUrl &&
        ageRating == other.ageRating &&
        rentalPrice == other.rentalPrice &&
        streamUrl == other.streamUrl &&
        coverUrl == other.coverUrl &&
        isSeries == other.isSeries &&
        createdAt == other.createdAt &&
        releaseYear == other.releaseYear &&
        avgRating == other.avgRating &&
        ratingCount == other.ratingCount &&
        titleUnaccent == other.titleUnaccent;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        description,
        storyline,
        trailerUrl,
        ageRating,
        rentalPrice,
        streamUrl,
        coverUrl,
        isSeries,
        createdAt,
        releaseYear,
        avgRating,
        ratingCount,
        titleUnaccent
      ]);
}

MovieStruct createMovieStruct({
  int? id,
  String? title,
  String? description,
  String? storyline,
  String? trailerUrl,
  String? ageRating,
  int? rentalPrice,
  String? streamUrl,
  String? coverUrl,
  bool? isSeries,
  String? createdAt,
  int? releaseYear,
  double? avgRating,
  int? ratingCount,
  String? titleUnaccent,
}) =>
    MovieStruct(
      id: id,
      title: title,
      description: description,
      storyline: storyline,
      trailerUrl: trailerUrl,
      ageRating: ageRating,
      rentalPrice: rentalPrice,
      streamUrl: streamUrl,
      coverUrl: coverUrl,
      isSeries: isSeries,
      createdAt: createdAt,
      releaseYear: releaseYear,
      avgRating: avgRating,
      ratingCount: ratingCount,
      titleUnaccent: titleUnaccent,
    );
