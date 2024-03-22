import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/final_lista/confirm_retornar_comprar/confirm_retornar_comprar_widget.dart';
import '/final_lista/erro_msm/erro_msm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sequencia_model.dart';
export 'sequencia_model.dart';

class SequenciaWidget extends StatefulWidget {
  const SequenciaWidget({super.key});

  @override
  State<SequenciaWidget> createState() => _SequenciaWidgetState();
}

class _SequenciaWidgetState extends State<SequenciaWidget> {
  late SequenciaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SequenciaModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).info,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Início da sequencia',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  minLines: 1,
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Final da sequência',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  minLines: 1,
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController2Validator.asValidator(context),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<SorteioRow>>(
                  future: SorteioTable().querySingleRow(
                    queryFn: (q) => q.order('id'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFE3868F),
                            ),
                          ),
                        ),
                      );
                    }
                    List<SorteioRow> rowSorteioRowList = snapshot.data!;
                    final rowSorteioRow = rowSorteioRowList.isNotEmpty
                        ? rowSorteioRowList.first
                        : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder<List<UsuarioNoSorteioRow>>(
                          future: UsuarioNoSorteioTable().queryRows(
                            queryFn: (q) => q.eq(
                              'aplicativo_da_cartela',
                              FFAppState().numeroCartela,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFE3868F),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsuarioNoSorteioRow>
                                buttonUsuarioNoSorteioRowList = snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                if (rowSorteioRow!.encerrado!) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ErroMsmWidget(
                                          msm:
                                              'A compra de cartelas foi encerrada!',
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  if (true) {
                                    if (int.parse(_model.textController1.text) <
                                        int.parse(
                                            _model.textController2.text)) {
                                      while (buttonUsuarioNoSorteioRowList
                                              .length !=
                                          _model.contadorDeListas) {
                                        if (functions.intervaloSobreposto(
                                            ((int var1, int var2) {
                                              return [var1, var2];
                                            }(
                                                    int.parse(_model
                                                        .textController1.text),
                                                    int.parse(_model
                                                        .textController2.text)))
                                                .toList(),
                                            buttonUsuarioNoSorteioRowList
                                                .toList())) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: ErroMsmWidget(
                                                  msm:
                                                      'Esta Sequência já está sendo usada. Escolha outro.',
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          setState(() {
                                            _model.unique = false;
                                          });
                                          break;
                                        } else {
                                          setState(() {
                                            _model.contadorDeListas =
                                                _model.contadorDeListas + 1;
                                            _model.unique = true;
                                          });
                                        }
                                      }
                                      setState(() {
                                        _model.contadorDeListas = 0;
                                      });
                                      if (_model.unique) {
                                        setState(() {
                                          FFAppState()
                                              .addToCarrinho(CarrinhoStruct(
                                            idCartela:
                                                FFAppState().numeroCartela,
                                            intervalo: (int var1, int var2) {
                                              return [var1, var2];
                                            }(
                                                int.parse(_model
                                                    .textController1.text),
                                                int.parse(_model
                                                    .textController2.text)),
                                          ));
                                        });
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  ConfirmRetornarComprarWidget(),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.7,
                                              child: ErroMsmWidget(
                                                msm:
                                                    'O  primeiro numero da sequencia nao pode ser maior do que o segundo.',
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ErroMsmWidget(
                                            msm: (String qtd) {
                                              return ('Nesse Jogo compre ' +
                                                  qtd +
                                                  'e pague somente 1 então compre um número múltiplo de:' +
                                                  qtd);
                                            }(rowSorteioRow!.multiplicador!
                                                .toString()),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                }
                              },
                              text: 'Entrar na Lista',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 40.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).warning,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ].divide(SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
