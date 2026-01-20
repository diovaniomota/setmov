import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ApisStripe Group Code

class ApisStripeGroup {
  static String getBaseUrl() => 'https://n8n.uniteds.com.br/webhook/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateCostumerStripeCall createCostumerStripeCall =
      CreateCostumerStripeCall();
  static CheckoutPagamentoStripeCall checkoutPagamentoStripeCall =
      CheckoutPagamentoStripeCall();
  static SubtrairvalorCall subtrairvalorCall = SubtrairvalorCall();
}

class CreateCostumerStripeCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? nome = '',
    String? email = '',
  }) async {
    final baseUrl = ApisStripeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(uid)}",
  "email": "${escapeStringForJson(email)}",
  "name": "${escapeStringForJson(nome)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCostumerStripe',
      apiUrl: '${baseUrl}Create-customer',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckoutPagamentoStripeCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? coins = '',
    String? number = '',
  }) async {
    final baseUrl = ApisStripeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "coins": "${escapeStringForJson(coins)}",
  "number": "${escapeStringForJson(number)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkoutPagamentoStripe',
      apiUrl: '${baseUrl}CheckoutPagamentoSetmov',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? linkURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.checkout_url''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class SubtrairvalorCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? coins = '',
  }) async {
    final baseUrl = ApisStripeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "coins": "${escapeStringForJson(coins)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subtrairvalor',
      apiUrl: '${baseUrl}subtrairCoins',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? balance(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.balance''',
      ));
  int? newBalance(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.new_balance''',
      ));
  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

/// End ApisStripe Group Code

class SearchMoviesCall {
  static Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? apikey = '',
    String? query = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "${escapeStringForJson(query)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchMovies',
      apiUrl: 'https://supabase.konexapp.com.br/rest/v1/rpc/search_movies',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${bearerAuth}',
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].title''',
      ));
  static String? titleunaccent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].title_unaccent''',
      ));
  static String? coverurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].cover_url''',
      ));
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
