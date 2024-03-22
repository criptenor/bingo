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

Future<List<int>> acusarPresentinho(
  List<bool> listMarcacao,
  List<int>? listModalidade,
  List<dynamic> listJsonCartelas,
) async {
  List<int> acusarPresentinhosList = [];

  void acusarPresentinhoGenerico(List<List<int>> listIndex) {
    for (var cartela in listJsonCartelas) {
      List<bool> marks = List.filled(listIndex.length, false);
      int idCardValues = 0;
      for (var indexCardValues in listIndex) {
        int x = indexCardValues[0];
        int y = indexCardValues[1];
        if (cartela['card_values'][x][y] != null &&
            listMarcacao[cartela['card_values'][x][y] - 1]) {
          marks[idCardValues] = true;
        }
        idCardValues++;
      }
      int faltam = (listIndex.length) - 1;
      int? indexMarcacao;
      for (int i = 0; i < marks.length; i++) {
        if (marks[i]) {
          faltam--;
        } else {
          indexMarcacao = i;
        }
      }
      if (faltam == 0 && indexMarcacao != null) {
        int x = listIndex[indexMarcacao][0];
        int y = listIndex[indexMarcacao][1];
        acusarPresentinhosList.add(cartela['card_values'][x][y]);
      }
    }
  }

  void acusarModalidadeMaluca(int malucaNumero) {
    for (var cartela in listJsonCartelas) {
      List<int> numerosNaCartelaMarcados = [];
      List<int> numeroTotalNaCartela = [];

      for (var colunaMarcadosCartelaLoop in cartela['card_values']) {
        for (var numeroMarcadosCartelaLoop in colunaMarcadosCartelaLoop) {
          if (numeroMarcadosCartelaLoop != null) {
            numeroTotalNaCartela.add(numeroMarcadosCartelaLoop);

            if (listMarcacao[numeroMarcadosCartelaLoop - 1]) {
              numerosNaCartelaMarcados.add(numeroMarcadosCartelaLoop);
            }
          }
        }
      }
      if (numerosNaCartelaMarcados.length == malucaNumero - 1) {
        for (var numeroListaTotal in numeroTotalNaCartela) {
          if (!numerosNaCartelaMarcados.contains(numeroListaTotal)) {
            acusarPresentinhosList.add(numeroListaTotal);
          }
        }
      }
    }
  }

  if (listModalidade != null && listModalidade.contains(1)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 3],
      [3, 4],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  if (listModalidade != null && listModalidade.contains(2)) {
    List<List<int>> index;

    // Modalidade Quadra Superior Coluna 0
    index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Inferior Coluna 0
    index = [
      [0, 4],
      [0, 1],
      [0, 2],
      [0, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido meio faltando Coluna 0
    index = [
      [0, 0],
      [0, 1],
      [0, 3],
      [0, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando superior Coluna 0
    index = [
      [0, 0],
      [0, 2],
      [0, 3],
      [0, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando Inferior Coluna 0
    index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Superior Coluna 1
    index = [
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Inferior Coluna 1
    index = [
      [1, 4],
      [1, 1],
      [1, 2],
      [1, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido meio faltando Coluna 1
    index = [
      [1, 0],
      [1, 1],
      [1, 3],
      [1, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando superior Coluna 1
    index = [
      [1, 0],
      [1, 2],
      [1, 3],
      [1, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando Inferior Coluna 1
    index = [
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido meio faltando Coluna 2
    index = [
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Superior Coluna 3
    index = [
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Inferior Coluna 3
    index = [
      [3, 4],
      [3, 1],
      [3, 2],
      [3, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido meio faltando Coluna 3
    index = [
      [3, 0],
      [3, 1],
      [3, 3],
      [3, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando superior Coluna 3
    index = [
      [3, 0],
      [3, 2],
      [3, 3],
      [3, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando Inferior Coluna 3
    index = [
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Superior Coluna 4
    index = [
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra Inferior Coluna 4
    index = [
      [4, 4],
      [4, 1],
      [4, 2],
      [4, 3]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido meio faltando Coluna 4
    index = [
      [4, 0],
      [4, 1],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando superior Coluna 4
    index = [
      [4, 0],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);

    // Modalidade Quadra dividido 1 faltando Inferior Coluna 4
    index = [
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  // Modalidade Primeira Coluna
  if (listModalidade != null && listModalidade.contains(3)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  // Modalidade Segunda Coluna
  if (listModalidade != null && listModalidade.contains(3)) {
    List<List<int>> index = [
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  // Modalidade Quarta Coluna
  if (listModalidade != null && listModalidade.contains(3)) {
    List<List<int>> index = [
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 3],
      [3, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  // Modalidade Quinta Coluna
  if (listModalidade != null && listModalidade.contains(3)) {
    List<List<int>> index = [
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }
// Modalidade Quina Horizontal
  List<List<int>> fila_1 = [
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1]
  ];

  List<List<int>> fila_2 = [
    [0, 2],
    [1, 2],
    [2, 2],
    [3, 2],
    [4, 2]
  ];

  List<List<int>> fila_3 = [
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3]
  ];

  List<List<int>> fila_4 = [
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4]
  ];

// Modalidade Primeira Coluna
  if (listModalidade != null && listModalidade.contains(5)) {
    List<List<int>> index = fila_1;
    acusarPresentinhoGenerico(index);
  }

// Modalidade Segunda Coluna
  if (listModalidade != null && listModalidade.contains(5)) {
    List<List<int>> index = fila_2;
    acusarPresentinhoGenerico(index);
  }

// Modalidade Quarta Coluna
  if (listModalidade != null && listModalidade.contains(5)) {
    List<List<int>> index = fila_3;
    acusarPresentinhoGenerico(index);
  }

// Modalidade Quinta Coluna
  if (listModalidade != null && listModalidade.contains(5)) {
    List<List<int>> index = fila_4;
    acusarPresentinhoGenerico(index);
  }

// Modalidade BEO
  if (listModalidade != null && listModalidade.contains(6)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade Bolo Três Camadas
  if (listModalidade != null && listModalidade.contains(7)) {
    List<List<int>> index = [
      [0, 0],
      [0, 2],
      [0, 4],
      [1, 0],
      [1, 2],
      [1, 4],
      [2, 0],
      [2, 4],
      [3, 0],
      [3, 2],
      [3, 4],
      [4, 0],
      [4, 2],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade BNO
  if (listModalidade != null && listModalidade.contains(8)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade Tres Linhas Superior
  if (listModalidade != null && listModalidade.contains(9)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade ING
  if (listModalidade != null && listModalidade.contains(10)) {
    List<List<int>> index = [
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 3],
      [3, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade Dupla quina Vertical
  List<List<int>> coluna_0_1 = [
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
  ];

  List<List<int>> coluna_0_3 = [
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [3, 0],
    [3, 1],
    [3, 2],
    [3, 3],
    [3, 4],
  ];

  List<List<int>> coluna_0_4 = [
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
  ];

  List<List<int>> coluna_3_1 = [
    [3, 0],
    [3, 1],
    [3, 2],
    [3, 3],
    [3, 4],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
  ];

  List<List<int>> coluna_4_1 = [
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
  ];

  List<List<int>> coluna_4_3 = [
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [3, 0],
    [3, 1],
    [3, 2],
    [3, 3],
    [3, 4],
  ];

  List<List<int>> quinadupla_0_1 = [
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [4, 0],
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1],
  ];

  List<List<int>> quinadupla_0_3 = [
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [4, 0],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
  ];

  List<List<int>> quinadupla_0_4 = [
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [4, 0],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
  ];

  List<List<int>> quinadupla_3_1 = [
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1],
  ];

  List<List<int>> quinadupla_4_1 = [
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
  ];

  List<List<int>> quinadupla_4_3 = [
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
  ];

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(coluna_0_1);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(coluna_0_3);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(coluna_0_4);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(coluna_3_1);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(coluna_4_1);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(coluna_4_3);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(quinadupla_0_1);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(quinadupla_0_3);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(quinadupla_0_4);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(quinadupla_3_1);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(quinadupla_4_1);
  }

  if (listModalidade != null && listModalidade.contains(11)) {
    acusarPresentinhoGenerico(quinadupla_4_3);
  }
  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_0_1);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_0_3);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_0_4);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_3_1);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_4_1);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_4_3);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_0_1);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_0_3);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_0_4);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_3_1);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_4_1);
  }

  if (listModalidade != null && listModalidade.contains(12)) {
    acusarPresentinhoGenerico(coluna_4_3);
  }

  //Modalidade 7 Maluca
  if (listModalidade != null && listModalidade.contains(13)) {
    acusarModalidadeMaluca(7);
  }

  //Modalidade Dezena Maluca
  if (listModalidade != null && listModalidade.contains(14)) {
    acusarModalidadeMaluca(10);
  }

  List<List<int>> fila_1_ = [
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1]
  ];
  List<List<int>> fila_2_ = [
    [0, 2],
    [1, 2],
    [2, 2],
    [3, 2],
    [4, 2]
  ];
  List<List<int>> fila_3_ = [
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3]
  ];
  List<List<int>> fila_4_ = [
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4]
  ];

  if (listModalidade != null && listModalidade.contains(15)) {
    acusarPresentinhoGenerico(fila_1_);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    acusarPresentinhoGenerico(fila_2_);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    List<List<int>> index = fila_3_;
    acusarPresentinhoGenerico(index);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    List<List<int>> index = fila_4_;
    acusarPresentinhoGenerico(index);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    List<List<int>> index = [
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    List<List<int>> index = [
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 3],
      [3, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

  if (listModalidade != null && listModalidade.contains(15)) {
    List<List<int>> index = [
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade Martelo Para Cima
  if (listModalidade != null && listModalidade.contains(16)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 0],
      [3, 1],
      [4, 0],
      [4, 1]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade Martelo Para Baixo
  if (listModalidade != null && listModalidade.contains(17)) {
    List<List<int>> index = [
      [0, 3],
      [0, 4],
      [1, 3],
      [1, 4],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 3],
      [3, 4],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade Janelao
  if (listModalidade != null && listModalidade.contains(18)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 0],
      [1, 4],
      [2, 0],
      [2, 4],
      [3, 0],
      [3, 4],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade T
  if (listModalidade != null && listModalidade.contains(19)) {
    List<List<int>> index = [
      [0, 0],
      [1, 0],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 0],
      [4, 0]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade H
  if (listModalidade != null && listModalidade.contains(20)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 2],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(index);
  }

// Modalidade T lado Esquerdo
  if (listModalidade != null && listModalidade.contains(21)) {
    List<List<int>> index = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 2],
      [3, 2],
      [4, 2]
    ];
    acusarPresentinhoGenerico(index);
  }
// Modalidade T Maluco
  if (listModalidade != null && listModalidade.contains(22)) {
    // Modalidade T Maluco Para Cima
    List<List<int>> indexUp = [
      [0, 0],
      [1, 0],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 0],
      [4, 0]
    ];
    acusarPresentinhoGenerico(indexUp);

    // Modalidade T Maluco Para Baixo
    List<List<int>> indexDown = [
      [0, 4],
      [1, 4],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 4],
      [4, 4]
    ];
    acusarPresentinhoGenerico(indexDown);

    // Modalidade T Maluco Para o Lado Esquerdo
    List<List<int>> indexLeft = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 2],
      [3, 2],
      [4, 2]
    ];
    acusarPresentinhoGenerico(indexLeft);

    // Modalidade T Maluco Para o Lado Direito
    List<List<int>> indexRight = [
      [0, 2],
      [1, 2],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(indexRight);
  }

// Modalidade Quina Vertical

// Modalidade Z
  if (listModalidade != null && listModalidade.contains(23)) {
    List<List<int>> indexZ = [
      [0, 0],
      [1, 0],
      [2, 0],
      [3, 0],
      [4, 0],
      [1, 3],
      [3, 1],
      [0, 4],
      [1, 4],
      [2, 4],
      [3, 4],
      [4, 4]
    ];
    acusarPresentinhoGenerico(indexZ);
  }

// Modalidade Zero
  if (listModalidade != null && listModalidade.contains(24)) {
    List<List<int>> indexZero = [
      [0, 1],
      [0, 2],
      [0, 3],
      [1, 0],
      [1, 4],
      [2, 0],
      [2, 4],
      [3, 0],
      [3, 4],
      [4, 1],
      [4, 2],
      [4, 3]
    ];
    acusarPresentinhoGenerico(indexZero);
  }

// Modalidade Borboleta
  if (listModalidade != null && listModalidade.contains(25)) {
    List<List<int>> indexBorboleta = [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 1],
      [1, 2],
      [1, 3],
      [3, 1],
      [3, 2],
      [3, 3],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(indexBorboleta);
  }

// Modalidade Cacto
  if (listModalidade != null && listModalidade.contains(26)) {
    List<List<int>> indexCacto = [
      [0, 0],
      [0, 1],
      [0, 2],
      [1, 2],
      [2, 0],
      [2, 1],
      [2, 3],
      [2, 4],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2]
    ];
    acusarPresentinhoGenerico(indexCacto);
  }

// Modalidade Diagonal Esquerda
  if (listModalidade != null && listModalidade.contains(27)) {
    List<List<int>> indexDiagonalEsquerda = [
      [0, 0],
      [1, 1],
      [3, 3],
      [4, 4]
    ];
    acusarPresentinhoGenerico(indexDiagonalEsquerda);
  }

// Modalidade Diagonal Direita
  if (listModalidade != null && listModalidade.contains(28)) {
    List<List<int>> indexDiagonalDireita = [
      [0, 4],
      [1, 3],
      [3, 1],
      [4, 0]
    ];
    acusarPresentinhoGenerico(indexDiagonalDireita);
  }

// Modalidade X
  if (listModalidade != null && listModalidade.contains(29)) {
    List<List<int>> indexX = [
      [0, 0],
      [1, 1],
      [3, 3],
      [4, 4],
      [0, 4],
      [1, 3],
      [3, 1],
      [4, 0]
    ];
    acusarPresentinhoGenerico(indexX);
  }

  return acusarPresentinhosList;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
