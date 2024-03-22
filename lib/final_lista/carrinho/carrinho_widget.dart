import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/final_lista/gerando_pagamento/gerando_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carrinho_model.dart';
export 'carrinho_model.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({super.key});

  @override
  State<CarrinhoWidget> createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget> {
  late CarrinhoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarrinhoModel());

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

    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height * 1.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).warning,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Carrinho',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Builder(
                      builder: (context) {
                        final carrinho = FFAppState().carrinho.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: carrinho.length,
                          itemBuilder: (context, carrinhoIndex) {
                            final carrinhoItem = carrinho[carrinhoIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).warning,
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState()
                                                  .removeAtIndexFromCarrinho(
                                                      carrinhoIndex);
                                            });
                                          },
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 30.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      functions
                                          .nomedoBingo(carrinhoItem.idCartela),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        () {
                                          if (carrinhoItem.idCartela == 1) {
                                            return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020341_0000.png';
                                          } else if (carrinhoItem.idCartela ==
                                              2) {
                                            return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/Design%20sem%20nome%20(2)%20(1).png?t=2024-03-01T03%3A28%3A35.565Z';
                                          } else if (carrinhoItem.idCartela ==
                                              4) {
                                            return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020558_0000.png';
                                          } else {
                                            return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020515_0000.png';
                                          }
                                        }(),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      (String var1, String var2) {
                                        return var1 + '/' + var2;
                                      }(
                                          carrinhoItem.intervalo.first
                                              .toString(),
                                          carrinhoItem.intervalo.last
                                              .toString()),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: FutureBuilder<List<SorteioRow>>(
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
                        List<SorteioRow> buttonSorteioRowList = snapshot.data!;
                        final buttonSorteioRow = buttonSorteioRowList.isNotEmpty
                            ? buttonSorteioRowList.first
                            : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: GerandoPagamentoWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: 'Encerrar Compra',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).warning,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
