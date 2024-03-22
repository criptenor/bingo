// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<UsuarioNoSorteioRow>> pesquisasSupaBase(
  List<UsuarioNoSorteioRow>? registros,
  String? pesquisa,
) async {
  // fazer %pesquisa% nos registros.nome se pesquisa nulo retorne todos
  if (pesquisa == null || pesquisa.isEmpty) {
    return registros ?? [];
  }

  final resultadoPesquisa = registros
      ?.where((registro) =>
          registro.nome!.toLowerCase().contains(pesquisa.toLowerCase()))
      .toList();

  return resultadoPesquisa ?? [];
}
