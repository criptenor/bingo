import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/final_lista/erro_msm/erro_msm_widget.dart';
import '/final_lista/esperando_pagamento/esperando_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gerando_pagamento_model.dart';
export 'gerando_pagamento_model.dart';

class GerandoPagamentoWidget extends StatefulWidget {
  const GerandoPagamentoWidget({super.key});

  @override
  State<GerandoPagamentoWidget> createState() => _GerandoPagamentoWidgetState();
}

class _GerandoPagamentoWidgetState extends State<GerandoPagamentoWidget> {
  late GerandoPagamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GerandoPagamentoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<SorteioRow>>(
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
        List<SorteioRow> checkoutBottomSheet2SorteioRowList = snapshot.data!;
        final checkoutBottomSheet2SorteioRow =
            checkoutBottomSheet2SorteioRowList.isNotEmpty
                ? checkoutBottomSheet2SorteioRowList.first
                : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x25090F13),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bingo Oficial da Rô',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Compre agora sua cartela!',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 4.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nome ou Apelido',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    alignLabelWithHint: true,
                                    hintText: 'Ex.: Lucas',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 24.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      Builder(
                        builder: (context) {
                          final cartelas = FFAppState().carrinho.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: cartelas.length,
                            itemBuilder: (context, cartelasIndex) {
                              final cartelasItem = cartelas[cartelasIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      functions
                                          .nomedoBingo(cartelasItem.idCartela),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      (String var1, String var2) {
                                        return var1 + '/' + var2;
                                      }(cartelasItem.intervalo[0].toString(),
                                          cartelasItem.intervalo[1].toString()),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Divider(
                        height: 24.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 4.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxas de transação (0,99%)',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'R\$',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                      ),
                                ),
                                Text(
                                  functions
                                      .somenteDuasCasas(functions.taxa(
                                          FFAppState().carrinho.toList(),
                                          checkoutBottomSheet2SorteioRow!)[0])
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 4.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Valor Total em Cartelas',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'R\$',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                      ),
                                ),
                                Text(
                                  functions
                                      .somenteDuasCasas(functions.taxa(
                                          FFAppState().carrinho.toList(),
                                          checkoutBottomSheet2SorteioRow!)[1])
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 4.0, 12.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'R\$',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                      ),
                                ),
                                Text(
                                  functions
                                      .somenteDuasCasas(functions.taxa(
                                          FFAppState().carrinho.toList(),
                                          checkoutBottomSheet2SorteioRow!)[2])
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.taxa = functions.somenteDuasCasas(
                                  functions.taxa(FFAppState().carrinho.toList(),
                                      checkoutBottomSheet2SorteioRow!)[2]);
                            });
                            _model.apiResultp9f = await MercadopagoCall.call(
                              amount: functions.somenteDuasCasas(functions.taxa(
                                  FFAppState().carrinho.toList(),
                                  checkoutBottomSheet2SorteioRow!)[2]),
                              email: 'adeiltontoco11@gmail.com',
                              firstName: 'Adeilton',
                              lastName: 'Filho',
                              numberCpf: '20512281750',
                              identificationType: 'CPF',
                              token:
                                  'APP_USR-3670598789067419-082914-499a54f5fa47ddabc17be2267260c442-273265872',
                              uuid4: random_data.randomString(
                                16,
                                16,
                                true,
                                true,
                                true,
                              ),
                            );
                            if ((_model.apiResultp9f?.succeeded ?? true)) {
                              setState(() {
                                FFAppState().chavePix = getJsonField(
                                  (_model.apiResultp9f?.jsonBody ?? ''),
                                  r'''$.point_of_interaction.transaction_data.qr_code''',
                                ).toString();
                                FFAppState().idPag = getJsonField(
                                  (_model.apiResultp9f?.jsonBody ?? ''),
                                  r'''$.id''',
                                );
                                FFAppState().nome = _model.textController.text;
                                FFAppState().verificou = true;
                              });
                              await PagamentoTable().insert({
                                'status': 1,
                                'valor': functions.somenteDuasCasas(
                                    functions.taxa(
                                        FFAppState().carrinho.toList(),
                                        checkoutBottomSheet2SorteioRow!)[2]),
                                'id_sorteio':
                                    checkoutBottomSheet2SorteioRow?.id,
                                'id_pag_mp': getJsonField(
                                  (_model.apiResultp9f?.jsonBody ?? ''),
                                  r'''$.id''',
                                ),
                              });
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: EsperandoPagamentoWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ErroMsmWidget(
                                      msm:
                                          (_model.apiResultp9f?.bodyText ?? ''),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }

                            setState(() {});
                          },
                          text: 'Pague pelo Pix!',
                          icon: Icon(
                            Icons.pix_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 270.0,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
