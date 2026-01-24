import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserData')) {
        try {
          final serializedData = prefs.getString('ff_UserData') ?? '{}';
          _UserData =
              UserDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserDataStruct _UserData = UserDataStruct();
  UserDataStruct get UserData => _UserData;
  set UserData(UserDataStruct value) {
    _UserData = value;
    prefs.setString('ff_UserData', value.serialize());
  }

  void updateUserDataStruct(Function(UserDataStruct) updateFn) {
    updateFn(_UserData);
    prefs.setString('ff_UserData', _UserData.serialize());
  }

  bool _maintenance = true;
  bool get maintenance => _maintenance;
  set maintenance(bool value) {
    _maintenance = value;
  }

  String _img = '';
  String get img => _img;
  set img(String value) {
    _img = value;
  }

  bool _liked = true;
  bool get liked => _liked;
  set liked(bool value) {
    _liked = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}
