import '../database.dart';

class PinAdmTable extends SupabaseTable<PinAdmRow> {
  @override
  String get tableName => 'PIN_ADM';

  @override
  PinAdmRow createRow(Map<String, dynamic> data) => PinAdmRow(data);
}

class PinAdmRow extends SupabaseDataRow {
  PinAdmRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PinAdmTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get pin => getField<int>('PIN');
  set pin(int? value) => setField<int>('PIN', value);
}
