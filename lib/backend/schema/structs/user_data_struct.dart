// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends BaseStruct {
  UserDataStruct({
    bool? biometria,
    bool? primeiroAcesso,
  })  : _biometria = biometria,
        _primeiroAcesso = primeiroAcesso;

  // "Biometria" field.
  bool? _biometria;
  bool get biometria => _biometria ?? false;
  set biometria(bool? val) => _biometria = val;

  bool hasBiometria() => _biometria != null;

  // "PrimeiroAcesso" field.
  bool? _primeiroAcesso;
  bool get primeiroAcesso => _primeiroAcesso ?? true;
  set primeiroAcesso(bool? val) => _primeiroAcesso = val;

  bool hasPrimeiroAcesso() => _primeiroAcesso != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        biometria: data['Biometria'] as bool?,
        primeiroAcesso: data['PrimeiroAcesso'] as bool?,
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Biometria': _biometria,
        'PrimeiroAcesso': _primeiroAcesso,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Biometria': serializeParam(
          _biometria,
          ParamType.bool,
        ),
        'PrimeiroAcesso': serializeParam(
          _primeiroAcesso,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
        biometria: deserializeParam(
          data['Biometria'],
          ParamType.bool,
          false,
        ),
        primeiroAcesso: deserializeParam(
          data['PrimeiroAcesso'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct &&
        biometria == other.biometria &&
        primeiroAcesso == other.primeiroAcesso;
  }

  @override
  int get hashCode => const ListEquality().hash([biometria, primeiroAcesso]);
}

UserDataStruct createUserDataStruct({
  bool? biometria,
  bool? primeiroAcesso,
}) =>
    UserDataStruct(
      biometria: biometria,
      primeiroAcesso: primeiroAcesso,
    );
