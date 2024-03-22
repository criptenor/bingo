import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'erro_msm_model.dart';
export 'erro_msm_model.dart';

class ErroMsmWidget extends StatefulWidget {
  const ErroMsmWidget({
    super.key,
    this.msm,
  });

  final String? msm;

  @override
  State<ErroMsmWidget> createState() => _ErroMsmWidgetState();
}

class _ErroMsmWidgetState extends State<ErroMsmWidget> {
  late ErroMsmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErroMsmModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.contadorSair != 0) {
        setState(() {
          _model.contadorSair = _model.contadorSair! + (-1);
        });
        await Future.delayed(const Duration(milliseconds: 1000));
      }
      Navigator.pop(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/1709269076543.png?t=2024-03-02T21%3A36%3A33.852Z',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'Ops!',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget.msm,
                              'Erro, tente Novamente!',
                            ),
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
