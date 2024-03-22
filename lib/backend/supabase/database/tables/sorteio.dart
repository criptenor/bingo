import '../database.dart';

class SorteioTable extends SupabaseTable<SorteioRow> {
  @override
  String get tableName => 'sorteio';

  @override
  SorteioRow createRow(Map<String, dynamic> data) => SorteioRow(data);
}

class SorteioRow extends SupabaseDataRow {
  SorteioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SorteioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get horaSorteio => getField<DateTime>('hora_sorteio');
  set horaSorteio(DateTime? value) => setField<DateTime>('hora_sorteio', value);

  bool? get gratis => getField<bool>('gratis');
  set gratis(bool? value) => setField<bool>('gratis', value);

  int? get multiplicador => getField<int>('multiplicador');
  set multiplicador(int? value) => setField<int>('multiplicador', value);

  bool? get encerrado => getField<bool>('encerrado');
  set encerrado(bool? value) => setField<bool>('encerrado', value);
}
