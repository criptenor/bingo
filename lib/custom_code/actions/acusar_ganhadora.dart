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

import 'dart:async';

Future<List<dynamic>> acusarGanhadora(
  List<dynamic> json,
  List<bool> listMark,
  List<int> listModalidade,
) async {
  List<dynamic> cartelasGanhadoras = [];

  // Verificação da Cartela Cheia (ID 1)
  if (listModalidade.contains(1)) {
    bool cartelaCheia = true;

    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            !listMark[json[0]['card_values'][coluna][linha] - 1]) {
          cartelaCheia = false;
          break;
        }
      }
      if (!cartelaCheia) {
        break;
      }
    }

    if (cartelaCheia) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Quadra Vertical (ID 2)
  if (listModalidade.contains(2)) {
    bool quadraVertical = false;

    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      int marcacoesColuna = 0;

      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (coluna != 2 && // Ignorar coluna 2 (null)
            json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesColuna++;
        }
      }

      if (coluna != 2 && marcacoesColuna >= 4) {
        quadraVertical = true;
        break;
      }
    }

    if (quadraVertical) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Quina Vertical (ID 3)
  if (listModalidade.contains(3)) {
    bool quinaVertical = false;

    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      int marcacoesColuna = 0;

      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (coluna != 2 && // Ignorar coluna 2 (null)
            json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesColuna++;
        }
      }

      if (coluna != 2 && marcacoesColuna >= 5) {
        quinaVertical = true;
        break;
      }
    }

    if (quinaVertical) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Quadra Horizontal (ID 4)
  if (listModalidade.contains(4)) {
    bool quadraHorizontal = false;

    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha >= 4) {
        quadraHorizontal = true;
        break;
      }
    }

    if (quadraHorizontal) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Quina Horizontal (ID 5)
  if (listModalidade.contains(5)) {
    bool quinaHorizontal = false;

    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha >= 5) {
        quinaHorizontal = true;
        break;
      }
    }

    if (quinaHorizontal) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de BeO (ID 6)
  if (listModalidade.contains(6)) {
    bool coluna0Completa = true;
    bool coluna4Completa = true;

    // Verificação da Coluna 0
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    // Verificação da Coluna 4
    for (int linha = 0; linha < json[0]['card_values'][4].length; linha++) {
      if (json[0]['card_values'][4][linha] != null &&
          !listMark[json[0]['card_values'][4][linha] - 1]) {
        coluna4Completa = false;
        break;
      }
    }

    if (coluna0Completa && coluna4Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Bolo de Três Camadas (ID 7)
  if (listModalidade.contains(7)) {
    bool linha0Completa = true;
    bool linha2Completa = true;
    bool linha4Completa = true;

    // Verificação da Linha 0
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][0] != null &&
          !listMark[json[0]['card_values'][coluna][0] - 1]) {
        linha0Completa = false;
        break;
      }
    }

    // Verificação da Linha 2
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][2] != null &&
          !listMark[json[0]['card_values'][coluna][2] - 1]) {
        linha2Completa = false;
        break;
      }
    }

    // Verificação da Linha 4
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][4] != null &&
          !listMark[json[0]['card_values'][coluna][4] - 1]) {
        linha4Completa = false;
        break;
      }
    }

    if (linha0Completa && linha2Completa && linha4Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Modalidade BNO (ID 8)
  if (listModalidade.contains(8)) {
    bool coluna0Completa = true;
    bool coluna2Completa = true;
    bool coluna3Completa = true;

    // Verificação da Coluna 0
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    // Verificação da Coluna 2
    for (int linha = 0; linha < json[0]['card_values'][2].length; linha++) {
      if (json[0]['card_values'][2][linha] != null &&
          !listMark[json[0]['card_values'][2][linha] - 1]) {
        coluna2Completa = false;
        break;
      }
    }

    // Verificação da Coluna 3
    for (int linha = 0; linha < json[0]['card_values'][3].length; linha++) {
      if (json[0]['card_values'][3][linha] != null &&
          !listMark[json[0]['card_values'][3][linha] - 1]) {
        coluna3Completa = false;
        break;
      }
    }

    if (coluna0Completa && coluna2Completa && coluna3Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Três Linhas Horizontais Superiores (ID 9)
  if (listModalidade.contains(9)) {
    bool linhasSuperioresCompletas = true;

    // Verificação das Linhas 0, 1 e 2
    for (int linha = 0; linha < 3; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha != 5) {
        linhasSuperioresCompletas = false;
        break;
      }
    }

    if (linhasSuperioresCompletas) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação da Modalidade ING (ID 10)
  if (listModalidade.contains(10)) {
    bool coluna123Completas = true;

    // Verificação das Colunas 1, 2 e 3
    for (int coluna = 1; coluna <= 3; coluna++) {
      int marcacoesColuna = 0;

      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesColuna++;
        }
      }

      if (marcacoesColuna != 5) {
        coluna123Completas = false;
        break;
      }
    }

    if (coluna123Completas) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Dupla Quina Horizontal ou Vertical (ID 11)
  if (listModalidade.contains(11)) {
    int marcacoesLinhas = 0;
    int marcacoesColunas = 0;

    // Verificação de Linhas (exceto a Linha 2)
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (linha != 2 &&
            json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (linha != 2 && marcacoesLinha == 5) {
        marcacoesLinhas++;
      }
    }

    // Verificação de Colunas (exceto a Coluna 2)
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      int marcacoesColuna = 0;

      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (coluna != 2 &&
            json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesColuna++;
        }
      }

      if (coluna != 2 && marcacoesColuna == 5) {
        marcacoesColunas++;
      }
    }

    if (marcacoesLinhas >= 2 || marcacoesColunas >= 2) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  // Verificação de Quina Dupla Horizontal (ID 12)
  if (listModalidade.contains(12)) {
    int linhasCompletas = 0;

    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (linha != 2 &&
            json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (linha != 2 && marcacoesLinha == 5) {
        linhasCompletas++;
      }
    }

    if (linhasCompletas >= 2) {
      cartelasGanhadoras.add(json[0]);
    }
  }
// Verificação de 7 Maluca (ID 13)
  if (listModalidade.contains(13)) {
    int countTrue = listMark.where((item) => item == true).length;
    if (countTrue == 7) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação de Dezena Maluca (ID 14)
  if (listModalidade.contains(14)) {
    int countTrue = listMark.where((item) => item == true).length;
    if (countTrue == 10) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação de Quina Vertical e Horizontal (ID 15)
  if (listModalidade.contains(15)) {
    bool quinaVertical = false;
    bool quinaHorizontal = false;

    // Verificação de Quina Vertical
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      int marcacoesColuna = 0;

      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (coluna != 2 && // Ignorar coluna 2 (null)
            json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesColuna++;
        }
      }

      if (coluna != 2 && marcacoesColuna >= 5) {
        quinaVertical = true;
        break;
      }
    }

    // Verificação de Quina Horizontal
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha >= 5) {
        quinaHorizontal = true;
        break;
      }
    }

    if (quinaVertical || quinaHorizontal) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação de Martelo para Cima (ID 16)
  if (listModalidade.contains(16)) {
    bool linhas012Completas = true;
    bool coluna2Completa = true;

    // Verificação das Linhas 0, 1 e 2
    for (int linha = 0; linha < 3; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha != 5) {
        linhas012Completas = false;
        break;
      }
    }

    // Verificação da Coluna 2
    for (int linha = 0; linha < json[0]['card_values'][2].length; linha++) {
      if (json[0]['card_values'][2][linha] != null &&
          listMark[json[0]['card_values'][2][linha] - 1]) {
        coluna2Completa = false;
        break;
      }
    }

    if (linhas012Completas && coluna2Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação de Martelo para Baixo (ID 17)
  if (listModalidade.contains(17)) {
    bool linhas34Completas = true;
    bool coluna2Completa = true;

    // Verificação das Linhas 3 e 4
    for (int linha = 3; linha < 5; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha != 5) {
        linhas34Completas = false;
        break;
      }
    }

    // Verificação da Coluna 2
    for (int linha = 0; linha < json[0]['card_values'][2].length; linha++) {
      if (json[0]['card_values'][2][linha] != null &&
          listMark[json[0]['card_values'][2][linha] - 1]) {
        coluna2Completa = false;
        break;
      }
    }

    if (linhas34Completas && coluna2Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação de Janelão (ID 18)
  if (listModalidade.contains(18)) {
    bool linhas04Completas = true;
    bool colunas04Completas = true;

    // Verificação das Linhas 0 e 4
    for (int linha = 0; linha < 5; linha += 4) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha != 5) {
        linhas04Completas = false;
        break;
      }
    }

    // Verificação das Colunas 0 e 4
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna += 4) {
      int marcacoesColuna = 0;

      for (int linha = 0;
          linha < json[0]['card_values'][coluna].length;
          linha++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesColuna++;
        }
      }

      if (marcacoesColuna != 5) {
        colunas04Completas = false;
        break;
      }
    }

    if (linhas04Completas && colunas04Completas) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação da Modalidade T (ID 19)
  if (listModalidade.contains(19)) {
    bool linha0Completa = true;
    bool coluna2Completa = true;

    // Verificação da Linha 0
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][0] != null &&
          listMark[json[0]['card_values'][coluna][0] - 1]) {
        linha0Completa = false;
        break;
      }
    }

    // Verificação da Coluna 2
    for (int linha = 0; linha < json[0]['card_values'][2].length; linha++) {
      if (json[0]['card_values'][2][linha] != null &&
          listMark[json[0]['card_values'][2][linha] - 1]) {
        coluna2Completa = false;
        break;
      }
    }

    if (linha0Completa && coluna2Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação da Modalidade H (ID 20)
  if (listModalidade.contains(20)) {
    bool coluna0Completa = true;
    bool coluna4Completa = true;
    bool linha2Completa = true;

    // Verificação da Coluna 0
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    // Verificação da Coluna 4
    for (int linha = 0; linha < json[0]['card_values'][4].length; linha++) {
      if (json[0]['card_values'][4][linha] != null &&
          !listMark[json[0]['card_values'][4][linha] - 1]) {
        coluna4Completa = false;
        break;
      }
    }

    // Verificação da Linha 2
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][2] != null &&
          !listMark[json[0]['card_values'][coluna][2] - 1]) {
        linha2Completa = false;
        break;
      }
    }

    if (coluna0Completa && coluna4Completa && linha2Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }
// Verificação da Modalidade T Lado Esquerdo (ID 21)
  if (listModalidade.contains(21)) {
    bool coluna0Completa = true;
    bool linha2Completa = true;

    // Verificação da Coluna 0
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    // Verificação da Linha 2
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][2] != null &&
          !listMark[json[0]['card_values'][coluna][2] - 1]) {
        linha2Completa = false;
        break;
      }
    }

    if (coluna0Completa && linha2Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação da Modalidade TMaluco (ID 22)
  if (listModalidade.contains(22)) {
    bool tCompleto = false;
    bool tEsquerdoCompleto = false;
    bool linha4Coluna2Completo = false;
    bool coluna4Linha2Completo = false;

    // Verificação do T Completo
    bool linhas012Completas = true;
    bool coluna2Completa = true;

    for (int linha = 0; linha < 3; linha++) {
      int marcacoesLinha = 0;

      for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
        if (json[0]['card_values'][coluna][linha] != null &&
            listMark[json[0]['card_values'][coluna][linha] - 1]) {
          marcacoesLinha++;
        }
      }

      if (marcacoesLinha != 5) {
        linhas012Completas = false;
        break;
      }
    }

    for (int linha = 0; linha < json[0]['card_values'][2].length; linha++) {
      if (json[0]['card_values'][2][linha] != null &&
          listMark[json[0]['card_values'][2][linha] - 1]) {
        coluna2Completa = false;
        break;
      }
    }

    if (linhas012Completas && coluna2Completa) {
      tCompleto = true;
    }

    // Verificação do T Lado Esquerdo Completo
    bool coluna0Completa = true;

    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    if (coluna0Completa && coluna2Completa) {
      tEsquerdoCompleto = true;
    }

    // Verificação de Linha 4 e Coluna 2 Completo
    bool linha4Completa = true;
    bool coluna4Completa =
        true; // Inicializando coluna4Completa como verdadeira

    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][4] != null &&
          !listMark[json[0]['card_values'][coluna][4] - 1]) {
        linha4Completa = false;
        break;
      }
    }

    for (int linha = 0; linha < json[0]['card_values'][4].length; linha++) {
      if (json[0]['card_values'][4][linha] != null &&
          !listMark[json[0]['card_values'][4][linha] - 1]) {
        coluna4Completa = false;
        break;
      }
    }

    if (linha4Completa && coluna2Completa) {
      linha4Coluna2Completo = true;
    }

    // Verificação de Coluna 4 e Linha 2 Completo
    bool linha2Completa = true;

    for (int coluna = 0; coluna < json[0]['card_values'][4].length; coluna++) {
      if (json[0]['card_values'][4][coluna] != null &&
          !listMark[json[0]['card_values'][4][coluna] - 1]) {
        linha2Completa = false;
        break;
      }
    }

    if (coluna4Completa && linha2Completa) {
      coluna4Linha2Completo = true;
    }

    // Verificação das condições para acusar ganhadora
    if (tCompleto ||
        tEsquerdoCompleto ||
        linha4Coluna2Completo ||
        coluna4Linha2Completo) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação da Modalidade Z (ID 23)
  if (listModalidade.contains(23)) {
    bool linha0Completa = true;
    bool linha4Completa = true;
    bool marcacoes13e31 = false;

    // Verificação da Linha 0
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][0] != null &&
          !listMark[json[0]['card_values'][coluna][0] - 1]) {
        linha0Completa = false;
        break;
      }
    }

    // Verificação da Linha 4
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][4] != null &&
          !listMark[json[0]['card_values'][coluna][4] - 1]) {
        linha4Completa = false;
        break;
      }
    }

    // Verificação das marcações 1:3 e 3:1
    if (listMark[json[0]['card_values'][1][3] - 1] &&
        listMark[json[0]['card_values'][3][1] - 1]) {
      marcacoes13e31 = true;
    }

    // Verificação das condições para acusar ganhadora
    if (linha0Completa && linha4Completa && marcacoes13e31) {
      cartelasGanhadoras.add(json[0]);
    }
  }
// Verificação da Modalidade 0 (Zero no Meio)
  if (listModalidade.contains(24)) {
    bool linha0Completa = true;
    bool linha4Completa = true;
    bool coluna0Completa = true;
    bool coluna4Completa = true;

    // Verificação da Linha 0
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][0] != null &&
          !listMark[json[0]['card_values'][coluna][0] - 1]) {
        linha0Completa = false;
        break;
      }
    }

    // Verificação da Linha 4
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][4] != null &&
          !listMark[json[0]['card_values'][coluna][4] - 1]) {
        linha4Completa = false;
        break;
      }
    }

    // Verificação da Coluna 0
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    // Verificação da Coluna 4
    for (int linha = 0; linha < json[0]['card_values'][4].length; linha++) {
      if (json[0]['card_values'][4][linha] != null &&
          !listMark[json[0]['card_values'][4][linha] - 1]) {
        coluna4Completa = false;
        break;
      }
    }

    // Verificação das condições para acusar ganhadora
    if (linha0Completa &&
        linha4Completa &&
        coluna0Completa &&
        coluna4Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }
// Verificação da Modalidade Borboleta
  if (listModalidade.contains(25)) {
    bool coluna0Completa = true;
    bool coluna4Completa = true;
    int marcacoesColuna1 = 0;
    int marcacoesColuna3 = 0;

    // Verificação da Coluna 0
    for (int linha = 0; linha < json[0]['card_values'][0].length; linha++) {
      if (json[0]['card_values'][0][linha] != null &&
          !listMark[json[0]['card_values'][0][linha] - 1]) {
        coluna0Completa = false;
        break;
      }
    }

    // Verificação da Coluna 4
    for (int linha = 0; linha < json[0]['card_values'][4].length; linha++) {
      if (json[0]['card_values'][4][linha] != null &&
          !listMark[json[0]['card_values'][4][linha] - 1]) {
        coluna4Completa = false;
        break;
      }
    }

    // Verificação da Coluna 1
    for (int linha = 1; linha < 4; linha++) {
      if (json[0]['card_values'][1][linha] != null &&
          listMark[json[0]['card_values'][1][linha] - 1]) {
        marcacoesColuna1++;
      }
    }

    // Verificação da Coluna 3
    for (int linha = 1; linha < 4; linha++) {
      if (json[0]['card_values'][3][linha] != null &&
          listMark[json[0]['card_values'][3][linha] - 1]) {
        marcacoesColuna3++;
      }
    }

    // Verificação das condições para acusar ganhadora
    if (coluna0Completa &&
        coluna4Completa &&
        marcacoesColuna1 == 3 &&
        marcacoesColuna3 == 3) {
      cartelasGanhadoras.add(json[0]);
    }
  }
// Verificação da Modalidade Cacto (ID 26)
  if (listModalidade.contains(26)) {
    bool marcacao00 = false;
    bool marcacao01 = false;
    bool marcacao02 = false;
    bool marcacao40 = false;
    bool marcacao41 = false;
    bool marcacao42 = false;
    bool linha2Completa = true;
    bool coluna2Completa = true;

    // Verificação das marcações 0:0, 0:1, 0:2, 4:0, 4:1, 4:2
    if (listMark[json[0]['card_values'][0][0] - 1] &&
        listMark[json[0]['card_values'][0][1] - 1] &&
        listMark[json[0]['card_values'][0][2] - 1] &&
        listMark[json[0]['card_values'][4][0] - 1] &&
        listMark[json[0]['card_values'][4][1] - 1] &&
        listMark[json[0]['card_values'][4][2] - 1]) {
      marcacao00 = true;
      marcacao01 = true;
      marcacao02 = true;
      marcacao40 = true;
      marcacao41 = true;
      marcacao42 = true;
    }

    // Verificação da Linha 2
    for (int coluna = 0; coluna < json[0]['card_values'].length; coluna++) {
      if (json[0]['card_values'][coluna][2] != null &&
          !listMark[json[0]['card_values'][coluna][2] - 1]) {
        linha2Completa = false;
        break;
      }
    }

    // Verificação da Coluna 2
    for (int linha = 0; linha < json[0]['card_values'][2].length; linha++) {
      if (json[0]['card_values'][2][linha] != null &&
          !listMark[json[0]['card_values'][2][linha] - 1]) {
        coluna2Completa = false;
        break;
      }
    }

    // Verificação das condições para acusar ganhadora
    if (marcacao00 &&
        marcacao01 &&
        marcacao02 &&
        marcacao40 &&
        marcacao41 &&
        marcacao42 &&
        linha2Completa &&
        coluna2Completa) {
      cartelasGanhadoras.add(json[0]);
    }
  }
// Verificação da Modalidade Diagonal Esquerda
  if (listModalidade.contains(27)) {
    bool marcacao00 = false;
    bool marcacao11 = false;
    bool marcacao33 = false;
    bool marcacao44 = false;

    // Verificação das marcações 0:0, 1:1, 3:3, 4:4
    if (listMark[json[0]['card_values'][0][0] - 1] &&
        listMark[json[0]['card_values'][1][1] - 1] &&
        listMark[json[0]['card_values'][3][3] - 1] &&
        listMark[json[0]['card_values'][4][4] - 1]) {
      marcacao00 = true;
      marcacao11 = true;
      marcacao33 = true;
      marcacao44 = true;
    }

    // Verificação das condições para acusar ganhadora
    if (marcacao00 && marcacao11 && marcacao33 && marcacao44) {
      cartelasGanhadoras.add(json[0]);
    }
  }

// Verificação da Modalidade Diagonal Direita
  if (listModalidade.contains(28)) {
    bool marcacao04 = false;
    bool marcacao13 = false;
    bool marcacao31 = false;
    bool marcacao40 = false;

    // Verificação das marcações 0:4, 1:3, 3:1, 4:0
    if (listMark[json[0]['card_values'][0][4] - 1] &&
        listMark[json[0]['card_values'][1][3] - 1] &&
        listMark[json[0]['card_values'][3][1] - 1] &&
        listMark[json[0]['card_values'][4][0] - 1]) {
      marcacao04 = true;
      marcacao13 = true;
      marcacao31 = true;
      marcacao40 = true;
    }

    // Verificação das condições para acusar ganhadora
    if (marcacao04 && marcacao13 && marcacao31 && marcacao40) {
      cartelasGanhadoras.add(json[0]);
    }
  }

  return cartelasGanhadoras;
}
