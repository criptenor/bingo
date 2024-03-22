import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/final_lista/confirm_retornar_comprar/confirm_retornar_comprar_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cartela_normal_widget.dart' show CartelaNormalWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartelaNormalModel extends FlutterFlowModel<CartelaNormalWidget> {
  ///  Local state fields for this component.

  int contador = 2;

  double taxa = 0.0099;

  int? totalCartelas = 3;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
