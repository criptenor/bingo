import '../database.dart';

class UsuarioNoSorteioTable extends SupabaseTable<UsuarioNoSorteioRow> {
  @override
  String get tableName => 'usuario_no_sorteio';

  @override
  UsuarioNoSorteioRow createRow(Map<String, dynamic> data) =>
      UsuarioNoSorteioRow(data);
}

class UsuarioNoSorteioRow extends SupabaseDataRow {
  UsuarioNoSorteioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioNoSorteioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get aplicativoDaCartela => getField<int>('aplicativo_da_cartela');
  set aplicativoDaCartela(int? value) =>
      setField<int>('aplicativo_da_cartela', value);

  List<int> get intervalo => getListField<int>('intervalo');
  set intervalo(List<int>? value) => setListField<int>('intervalo', value);

  int? get idPag => getField<int>('id_pag');
  set idPag(int? value) => setField<int>('id_pag', value);
}
