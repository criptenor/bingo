import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://nerrggcqrzinmqokfdwh.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5lcnJnZ2Nxcnppbm1xb2tmZHdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkxNDU4OTcsImV4cCI6MjAyNDcyMTg5N30.t6dSnOEOM_HVM2KEiZ87Tn_wztQjkxZo5wYB54WX1Ds';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
