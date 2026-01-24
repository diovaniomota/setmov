import 'dart:convert';

import 'package:flutter/material.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
  final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = (param as DateTime).millisecondsSinceEpoch.toString();
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);

      case ParamType.DataStruct:
        data = param is BaseStruct ? param.serialize() : null;

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  return DateTimeRange(
    start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
    end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  DataStruct,
  SupabaseRow,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  StructBuilder<T>? structBuilder,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        final milliseconds = int.tryParse(param);
        return milliseconds != null
            ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
            : null;
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case MovieLikesRow:
            return MovieLikesRow(data);
          case BlsRow:
            return BlsRow(data);
          case CommentLikeCountRow:
            return CommentLikeCountRow(data);
          case PaymentConfirmationRow:
            return PaymentConfirmationRow(data);
          case UserFollowsRow:
            return UserFollowsRow(data);
          case UserCreditsRow:
            return UserCreditsRow(data);
          case MovieFavoritesRow:
            return MovieFavoritesRow(data);
          case WalletsRow:
            return WalletsRow(data);
          case MoviesSearchVRow:
            return MoviesSearchVRow(data);
          case SeriesEpisodesRow:
            return SeriesEpisodesRow(data);
          case MovieCategoriesRow:
            return MovieCategoriesRow(data);
          case SchemaMigrationsRow:
            return SchemaMigrationsRow(data);
          case UserActivityFeedRow:
            return UserActivityFeedRow(data);
          case UsersPublicRow:
            return UsersPublicRow(data);
          case ViewUserFollowingWithAvatarRow:
            return ViewUserFollowingWithAvatarRow(data);
          case UserCategoriesRow:
            return UserCategoriesRow(data);
          case UserWatchedMoviesRow:
            return UserWatchedMoviesRow(data);
          case MovieCommentsRow:
            return MovieCommentsRow(data);
          case ViewUserCommentsByIdRow:
            return ViewUserCommentsByIdRow(data);
          case ExtensionsRow:
            return ExtensionsRow(data);
          case CommentLikesRow:
            return CommentLikesRow(data);
          case MovieRentalsRow:
            return MovieRentalsRow(data);
          case ViewAllCommentsRow:
            return ViewAllCommentsRow(data);
          case UserFavoriteMoviesRow:
            return UserFavoriteMoviesRow(data);
          case ViewUserFollowingWithAvatarByIdRow:
            return ViewUserFollowingWithAvatarByIdRow(data);
          case MovieHistoryRow:
            return MovieHistoryRow(data);
          case FeedFollowersCommentsRow:
            return FeedFollowersCommentsRow(data);
          case MovieRatingsRow:
            return MovieRatingsRow(data);
          case TenantsRow:
            return TenantsRow(data);
          case FeedRecentCommentsRow:
            return FeedRecentCommentsRow(data);
          case UsersRow:
            return UsersRow(data);
          case MovieAverageRatingRow:
            return MovieAverageRatingRow(data);
          case WalletTransactionsRow:
            return WalletTransactionsRow(data);
          case MoviesRow:
            return MoviesRow(data);
          case ViewMyCommentsRow:
            return ViewMyCommentsRow(data);
          case UserProfileWithCreditsRow:
            return UserProfileWithCreditsRow(data);
          case UserNotificationsRow:
            return UserNotificationsRow(data);
          case CategoriesRow:
            return CategoriesRow(data);
          case ViewUserFollowsWithAvatarRow:
            return ViewUserFollowsWithAvatarRow(data);
          case CommentWithUserRow:
            return CommentWithUserRow(data);
          case UserCardsRow:
            return UserCardsRow(data);
          default:
            return null;
        }

      case ParamType.DataStruct:
        final data = json.decode(param) as Map<String, dynamic>? ?? {};
        return structBuilder != null ? structBuilder(data) : null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}
