import '../database.dart';

class PagamentoTable extends SupabaseTable<PagamentoRow> {
  @override
  String get tableName => 'pagamento';

  @override
  PagamentoRow createRow(Map<String, dynamic> data) => PagamentoRow(data);
}

class PagamentoRow extends SupabaseDataRow {
  PagamentoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  int? get idSorteio => getField<int>('id_sorteio');
  set idSorteio(int? value) => setField<int>('id_sorteio', value);

  int? get idPagMp => getField<int>('id_pag_mp');
  set idPagMp(int? value) => setField<int>('id_pag_mp', value);
}
