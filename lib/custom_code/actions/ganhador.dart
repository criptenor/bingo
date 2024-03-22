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

Future<int> ganhador(
  List<bool>? listMark,
  List<String>? listMartiz,
) async {
  // Crie uma lista temporária para armazenar as listas de números tratadas
  List<List<int>> tempListasTratadas = [];

  // Converter strings em listas de números e armazenar em tempListasTratadas
  for (String matrixStr in listMartiz!) {
    List<int> numerosTratados = [];
    List<String> numerosStr = matrixStr.split(' ');

    for (String numStr in numerosStr) {
      if (numStr.trim().isNotEmpty) {
        try {
          int num = int.parse(numStr);
          numerosTratados.add(num);
        } catch (e) {
          // Ignorar valores que não podem ser convertidos para int
        }
      }
    }

    tempListasTratadas.add(numerosTratados);
  }

  // Iterar sobre as listas tratadas e verificar as condições
  for (int i = 0; i < tempListasTratadas.length; i++) {
    bool todosTrue = true;

    for (int num in tempListasTratadas[i]) {
      if (!listMark![num - 1]) {
        todosTrue = false;
        break;
      }
    }

    if (todosTrue) {
      return listMark![i] ? i : 100;
    }
  }

  return 100; // Se nenhuma lista estiver completa
}
