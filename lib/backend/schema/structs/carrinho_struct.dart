// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoStruct extends BaseStruct {
  CarrinhoStruct({
    int? idCartela,
    List<int>? intervalo,
  })  : _idCartela = idCartela,
        _intervalo = intervalo;

  // "idCartela" field.
  int? _idCartela;
  int get idCartela => _idCartela ?? 0;
  set idCartela(int? val) => _idCartela = val;
  void incrementIdCartela(int amount) => _idCartela = idCartela + amount;
  bool hasIdCartela() => _idCartela != null;

  // "intervalo" field.
  List<int>? _intervalo;
  List<int> get intervalo => _intervalo ?? const [];
  set intervalo(List<int>? val) => _intervalo = val;
  void updateIntervalo(Function(List<int>) updateFn) =>
      updateFn(_intervalo ??= []);
  bool hasIntervalo() => _intervalo != null;

  static CarrinhoStruct fromMap(Map<String, dynamic> data) => CarrinhoStruct(
        idCartela: castToType<int>(data['idCartela']),
        intervalo: getDataList(data['intervalo']),
      );

  static CarrinhoStruct? maybeFromMap(dynamic data) =>
      data is Map ? CarrinhoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'idCartela': _idCartela,
        'intervalo': _intervalo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idCartela': serializeParam(
          _idCartela,
          ParamType.int,
        ),
        'intervalo': serializeParam(
          _intervalo,
          ParamType.int,
          true,
        ),
      }.withoutNulls;

  static CarrinhoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarrinhoStruct(
        idCartela: deserializeParam(
          data['idCartela'],
          ParamType.int,
          false,
        ),
        intervalo: deserializeParam<int>(
          data['intervalo'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'CarrinhoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CarrinhoStruct &&
        idCartela == other.idCartela &&
        listEquality.equals(intervalo, other.intervalo);
  }

  @override
  int get hashCode => const ListEquality().hash([idCartela, intervalo]);
}

CarrinhoStruct createCarrinhoStruct({
  int? idCartela,
}) =>
    CarrinhoStruct(
      idCartela: idCartela,
    );
