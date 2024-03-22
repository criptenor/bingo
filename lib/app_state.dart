import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _carrinho = prefs
              .getStringList('ff_carrinho')
              ?.map((x) {
                try {
                  return CarrinhoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _carrinho;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _idEntrarNoSorteio = 0;
  int get idEntrarNoSorteio => _idEntrarNoSorteio;
  set idEntrarNoSorteio(int _value) {
    _idEntrarNoSorteio = _value;
  }

  List<bool> _SelectQuantidade = [];
  List<bool> get SelectQuantidade => _SelectQuantidade;
  set SelectQuantidade(List<bool> _value) {
    _SelectQuantidade = _value;
  }

  void addToSelectQuantidade(bool _value) {
    _SelectQuantidade.add(_value);
  }

  void removeFromSelectQuantidade(bool _value) {
    _SelectQuantidade.remove(_value);
  }

  void removeAtIndexFromSelectQuantidade(int _index) {
    _SelectQuantidade.removeAt(_index);
  }

  void updateSelectQuantidadeAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _SelectQuantidade[_index] = updateFn(_SelectQuantidade[_index]);
  }

  void insertAtIndexInSelectQuantidade(int _index, bool _value) {
    _SelectQuantidade.insert(_index, _value);
  }

  String _cartelaAtual = '';
  String get cartelaAtual => _cartelaAtual;
  set cartelaAtual(String _value) {
    _cartelaAtual = _value;
  }

  int _idCompra = 0;
  int get idCompra => _idCompra;
  set idCompra(int _value) {
    _idCompra = _value;
  }

  List<int> _selectCartelaBd = [];
  List<int> get selectCartelaBd => _selectCartelaBd;
  set selectCartelaBd(List<int> _value) {
    _selectCartelaBd = _value;
  }

  void addToSelectCartelaBd(int _value) {
    _selectCartelaBd.add(_value);
  }

  void removeFromSelectCartelaBd(int _value) {
    _selectCartelaBd.remove(_value);
  }

  void removeAtIndexFromSelectCartelaBd(int _index) {
    _selectCartelaBd.removeAt(_index);
  }

  void updateSelectCartelaBdAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _selectCartelaBd[_index] = updateFn(_selectCartelaBd[_index]);
  }

  void insertAtIndexInSelectCartelaBd(int _index, int _value) {
    _selectCartelaBd.insert(_index, _value);
  }

  int _controll = 0;
  int get controll => _controll;
  set controll(int _value) {
    _controll = _value;
  }

  List<dynamic> _JsonNumeroCartelas = [];
  List<dynamic> get JsonNumeroCartelas => _JsonNumeroCartelas;
  set JsonNumeroCartelas(List<dynamic> _value) {
    _JsonNumeroCartelas = _value;
  }

  void addToJsonNumeroCartelas(dynamic _value) {
    _JsonNumeroCartelas.add(_value);
  }

  void removeFromJsonNumeroCartelas(dynamic _value) {
    _JsonNumeroCartelas.remove(_value);
  }

  void removeAtIndexFromJsonNumeroCartelas(int _index) {
    _JsonNumeroCartelas.removeAt(_index);
  }

  void updateJsonNumeroCartelasAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _JsonNumeroCartelas[_index] = updateFn(_JsonNumeroCartelas[_index]);
  }

  void insertAtIndexInJsonNumeroCartelas(int _index, dynamic _value) {
    _JsonNumeroCartelas.insert(_index, _value);
  }

  List<String> _listCartelasPorUsuarioTratado = [];
  List<String> get listCartelasPorUsuarioTratado =>
      _listCartelasPorUsuarioTratado;
  set listCartelasPorUsuarioTratado(List<String> _value) {
    _listCartelasPorUsuarioTratado = _value;
  }

  void addToListCartelasPorUsuarioTratado(String _value) {
    _listCartelasPorUsuarioTratado.add(_value);
  }

  void removeFromListCartelasPorUsuarioTratado(String _value) {
    _listCartelasPorUsuarioTratado.remove(_value);
  }

  void removeAtIndexFromListCartelasPorUsuarioTratado(int _index) {
    _listCartelasPorUsuarioTratado.removeAt(_index);
  }

  void updateListCartelasPorUsuarioTratadoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listCartelasPorUsuarioTratado[_index] =
        updateFn(_listCartelasPorUsuarioTratado[_index]);
  }

  void insertAtIndexInListCartelasPorUsuarioTratado(int _index, String _value) {
    _listCartelasPorUsuarioTratado.insert(_index, _value);
  }

  List<double> _percentList = [];
  List<double> get percentList => _percentList;
  set percentList(List<double> _value) {
    _percentList = _value;
  }

  void addToPercentList(double _value) {
    _percentList.add(_value);
  }

  void removeFromPercentList(double _value) {
    _percentList.remove(_value);
  }

  void removeAtIndexFromPercentList(int _index) {
    _percentList.removeAt(_index);
  }

  void updatePercentListAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _percentList[_index] = updateFn(_percentList[_index]);
  }

  void insertAtIndexInPercentList(int _index, double _value) {
    _percentList.insert(_index, _value);
  }

  List<int> _AcumuladoSorteio = [];
  List<int> get AcumuladoSorteio => _AcumuladoSorteio;
  set AcumuladoSorteio(List<int> _value) {
    _AcumuladoSorteio = _value;
  }

  void addToAcumuladoSorteio(int _value) {
    _AcumuladoSorteio.add(_value);
  }

  void removeFromAcumuladoSorteio(int _value) {
    _AcumuladoSorteio.remove(_value);
  }

  void removeAtIndexFromAcumuladoSorteio(int _index) {
    _AcumuladoSorteio.removeAt(_index);
  }

  void updateAcumuladoSorteioAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _AcumuladoSorteio[_index] = updateFn(_AcumuladoSorteio[_index]);
  }

  void insertAtIndexInAcumuladoSorteio(int _index, int _value) {
    _AcumuladoSorteio.insert(_index, _value);
  }

  List<int> _listModalidadeUsuario = [];
  List<int> get listModalidadeUsuario => _listModalidadeUsuario;
  set listModalidadeUsuario(List<int> _value) {
    _listModalidadeUsuario = _value;
  }

  void addToListModalidadeUsuario(int _value) {
    _listModalidadeUsuario.add(_value);
  }

  void removeFromListModalidadeUsuario(int _value) {
    _listModalidadeUsuario.remove(_value);
  }

  void removeAtIndexFromListModalidadeUsuario(int _index) {
    _listModalidadeUsuario.removeAt(_index);
  }

  void updateListModalidadeUsuarioAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _listModalidadeUsuario[_index] = updateFn(_listModalidadeUsuario[_index]);
  }

  void insertAtIndexInListModalidadeUsuario(int _index, int _value) {
    _listModalidadeUsuario.insert(_index, _value);
  }

  List<bool> _markGanhar = [];
  List<bool> get markGanhar => _markGanhar;
  set markGanhar(List<bool> _value) {
    _markGanhar = _value;
  }

  void addToMarkGanhar(bool _value) {
    _markGanhar.add(_value);
  }

  void removeFromMarkGanhar(bool _value) {
    _markGanhar.remove(_value);
  }

  void removeAtIndexFromMarkGanhar(int _index) {
    _markGanhar.removeAt(_index);
  }

  void updateMarkGanharAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _markGanhar[_index] = updateFn(_markGanhar[_index]);
  }

  void insertAtIndexInMarkGanhar(int _index, bool _value) {
    _markGanhar.insert(_index, _value);
  }

  String _chavePix = '';
  String get chavePix => _chavePix;
  set chavePix(String _value) {
    _chavePix = _value;
  }

  int _idPag = 0;
  int get idPag => _idPag;
  set idPag(int _value) {
    _idPag = _value;
  }

  String _aprovado = 'approved\n';
  String get aprovado => _aprovado;
  set aprovado(String _value) {
    _aprovado = _value;
  }

  String _cahavePixCopia = '';
  String get cahavePixCopia => _cahavePixCopia;
  set cahavePixCopia(String _value) {
    _cahavePixCopia = _value;
  }

  bool _sorteioGratis = false;
  bool get sorteioGratis => _sorteioGratis;
  set sorteioGratis(bool _value) {
    _sorteioGratis = _value;
  }

  List<dynamic> _jsonCartelasAuxiliar = [];
  List<dynamic> get jsonCartelasAuxiliar => _jsonCartelasAuxiliar;
  set jsonCartelasAuxiliar(List<dynamic> _value) {
    _jsonCartelasAuxiliar = _value;
  }

  void addToJsonCartelasAuxiliar(dynamic _value) {
    _jsonCartelasAuxiliar.add(_value);
  }

  void removeFromJsonCartelasAuxiliar(dynamic _value) {
    _jsonCartelasAuxiliar.remove(_value);
  }

  void removeAtIndexFromJsonCartelasAuxiliar(int _index) {
    _jsonCartelasAuxiliar.removeAt(_index);
  }

  void updateJsonCartelasAuxiliarAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _jsonCartelasAuxiliar[_index] = updateFn(_jsonCartelasAuxiliar[_index]);
  }

  void insertAtIndexInJsonCartelasAuxiliar(int _index, dynamic _value) {
    _jsonCartelasAuxiliar.insert(_index, _value);
  }

  bool _jogarComOMaco = false;
  bool get jogarComOMaco => _jogarComOMaco;
  set jogarComOMaco(bool _value) {
    _jogarComOMaco = _value;
  }

  bool _verificou = false;
  bool get verificou => _verificou;
  set verificou(bool _value) {
    _verificou = _value;
  }

  String _nome = '';
  String get nome => _nome;
  set nome(String _value) {
    _nome = _value;
  }

  String _cartela = '';
  String get cartela => _cartela;
  set cartela(String _value) {
    _cartela = _value;
  }

  List<int> _intervalo = [];
  List<int> get intervalo => _intervalo;
  set intervalo(List<int> _value) {
    _intervalo = _value;
  }

  void addToIntervalo(int _value) {
    _intervalo.add(_value);
  }

  void removeFromIntervalo(int _value) {
    _intervalo.remove(_value);
  }

  void removeAtIndexFromIntervalo(int _index) {
    _intervalo.removeAt(_index);
  }

  void updateIntervaloAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _intervalo[_index] = updateFn(_intervalo[_index]);
  }

  void insertAtIndexInIntervalo(int _index, int _value) {
    _intervalo.insert(_index, _value);
  }

  int _aplicativo = 0;
  int get aplicativo => _aplicativo;
  set aplicativo(int _value) {
    _aplicativo = _value;
  }

  int _numeroCartela = 0;
  int get numeroCartela => _numeroCartela;
  set numeroCartela(int _value) {
    _numeroCartela = _value;
  }

  dynamic _listaFinalJson;
  dynamic get listaFinalJson => _listaFinalJson;
  set listaFinalJson(dynamic _value) {
    _listaFinalJson = _value;
  }

  List<CarrinhoStruct> _carrinho = [];
  List<CarrinhoStruct> get carrinho => _carrinho;
  set carrinho(List<CarrinhoStruct> _value) {
    _carrinho = _value;
    prefs.setStringList(
        'ff_carrinho', _value.map((x) => x.serialize()).toList());
  }

  void addToCarrinho(CarrinhoStruct _value) {
    _carrinho.add(_value);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => x.serialize()).toList());
  }

  void removeFromCarrinho(CarrinhoStruct _value) {
    _carrinho.remove(_value);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCarrinho(int _index) {
    _carrinho.removeAt(_index);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => x.serialize()).toList());
  }

  void updateCarrinhoAtIndex(
    int _index,
    CarrinhoStruct Function(CarrinhoStruct) updateFn,
  ) {
    _carrinho[_index] = updateFn(_carrinho[_index]);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCarrinho(int _index, CarrinhoStruct _value) {
    _carrinho.insert(_index, _value);
    prefs.setStringList(
        'ff_carrinho', _carrinho.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
