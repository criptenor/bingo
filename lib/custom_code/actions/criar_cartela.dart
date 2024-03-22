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

import 'dart:convert';
import 'dart:math';

Future<dynamic> criarCartela() async {
  List<List<int?>> cardValues = [];
  final random = Random();

  List<int> rowStartValues = [0, 15, 30, 45, 60];
  List<int> rowIntervals = [15, 15, 15, 15, 15]; // Interval size for each row

  for (int row = 0; row < 5; row++) {
    List<int?> newRow = [];
    List<int> usedNumbers = []; // Track used numbers for the current row
    for (int col = 0; col < 5; col++) {
      if (row == 2 && col == 2) {
        newRow.add(null);
      } else {
        int intervalStart = rowStartValues[row];
        int intervalSize = rowIntervals[row];

        int randomNumber;
        do {
          randomNumber = intervalStart + random.nextInt(intervalSize) + 1;
        } while (usedNumbers.contains(randomNumber));

        usedNumbers.add(randomNumber);
        newRow.add(randomNumber);
      }
    }
    cardValues.add(newRow);
  }

  String cardValuesJson = json.encode(cardValues);
  String cardHash = calculateSimpleHash(cardValuesJson);

  Map<String, dynamic> bingoCard = {
    "card_values": cardValues,
    "card_type": "random_non_repeating",
    "card_hash": cardHash
  };

  return bingoCard;
}

String calculateSimpleHash(String input) {
  int hash = 0;
  for (int i = 0; i < input.length; i++) {
    hash = (31 * hash + input.codeUnitAt(i)) & 0xFFFFFFFF;
  }
  return hash.toString();
}

void main() async {
  dynamic bingoCard = await criarCartela();
  // Do something with the generated bingoCard, like storing it or processing it further
}
