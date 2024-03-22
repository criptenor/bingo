import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_padrao_model.dart';
export 'button_padrao_model.dart';

class ButtonPadraoWidget extends StatefulWidget {
  const ButtonPadraoWidget({super.key});

  @override
  State<ButtonPadraoWidget> createState() => _ButtonPadraoWidgetState();
}

class _ButtonPadraoWidgetState extends State<ButtonPadraoWidget> {
  late ButtonPadraoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonPadraoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: 'Entrar na Lista',
          options: FFButtonOptions(
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: 40.0,
            padding: EdgeInsets.all(0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: Color(0xFFDB6D78),
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
            elevation: 3.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ],
    );
  }
}
