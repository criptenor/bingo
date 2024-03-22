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

Future newCustomAction(String dateTimeString) async {
  // fazer um countdown em loop de 1 segundo recebendo:dateTime return H:M:S
  String formattedTime = '';
  String formattedHour = '';

  DateTime dateTime = DateTime.parse(dateTimeString);

  while (true) {
    Duration difference = dateTime.difference(DateTime.now());
    if (difference.isNegative) {
      formattedTime = '00:00:00';
      formattedHour = '00:00';
      break;
    }

    int daysToHours = difference.inDays * 24;
    int hours = daysToHours + difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    int seconds = difference.inSeconds.remainder(60);
    formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    formattedHour = '${hours.toString().padLeft(2, '0')}:00';

    await Future.delayed(Duration(seconds: 1));
  }

  // You can now use 'formattedTime' and 'formattedHour' in your application as needed.
}
