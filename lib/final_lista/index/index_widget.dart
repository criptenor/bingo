import '/backend/supabase/supabase.dart';
import '/final_lista/erro_msm/erro_msm_widget.dart';
import '/final_lista/login_a_d_m/login_a_d_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'index_model.dart';
export 'index_model.dart';

class IndexWidget extends StatefulWidget {
  const IndexWidget({super.key});

  @override
  State<IndexWidget> createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget>
    with TickerProviderStateMixin {
  late IndexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndexModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SorteioRow>>(
      future: SorteioTable().querySingleRow(
        queryFn: (q) => q.order('id'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFE3868F),
                  ),
                ),
              ),
            ),
          );
        }
        List<SorteioRow> indexSorteioRowList = snapshot.data!;
        final indexSorteioRow =
            indexSorteioRowList.isNotEmpty ? indexSorteioRowList.first : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            floatingActionButton: Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              child: LoginADMWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  backgroundColor: FlutterFlowTheme.of(context).info,
                  elevation: 8.0,
                  child: Icon(
                    Icons.admin_panel_settings,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/WhatsApp%20Image%202024-03-18%20at%2015.03.45.jpeg',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: FutureBuilder<List<UsuarioNoSorteioRow>>(
                              future: UsuarioNoSorteioTable().queryRows(
                                queryFn: (q) => q,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFE3868F),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsuarioNoSorteioRow>
                                    dropdown11UserListUsuarioNoSorteioRowList =
                                    snapshot.data!;
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                'Bingo Começa em:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'd/M H:mm',
                                                    indexSorteioRow!
                                                        .horaSorteio!),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 19.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment(0.0, 0),
                                                child: TabBar(
                                                  isScrollable: true,
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  unselectedLabelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 14.0,
                                                          ),
                                                  unselectedLabelStyle:
                                                      TextStyle(),
                                                  indicatorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  padding: EdgeInsets.all(4.0),
                                                  tabs: [
                                                    Tab(
                                                      text:
                                                          'BBSorte/\nAR Bingo',
                                                    ),
                                                    Tab(
                                                      text: 'Grandioso',
                                                    ),
                                                    Tab(
                                                      text: 'APP Qualquer',
                                                    ),
                                                  ],
                                                  controller:
                                                      _model.tabBarController,
                                                  onTap: (i) async {
                                                    [
                                                      () async {},
                                                      () async {},
                                                      () async {}
                                                    ][i]();
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  controller:
                                                      _model.tabBarController,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final listPessoas = functions
                                                                .cartelasComIds(
                                                                    dropdown11UserListUsuarioNoSorteioRowList
                                                                        .toList(),
                                                                    ([
                                                                      1,
                                                                      2
                                                                    ]).toList())
                                                                ?.toList() ??
                                                            [];
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: listPessoas
                                                              .length,
                                                          itemBuilder: (context,
                                                              listPessoasIndex) {
                                                            final listPessoasItem =
                                                                listPessoas[
                                                                    listPessoasIndex];
                                                            return AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      150),
                                                              curve: Curves
                                                                  .easeInOut,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                        child: Image
                                                                            .network(
                                                                          () {
                                                                            if (listPessoasItem.aplicativoDaCartela ==
                                                                                1) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020341_0000.png';
                                                                            } else if (listPessoasItem.aplicativoDaCartela ==
                                                                                2) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/Design%20sem%20nome%20(2)%20(1).png?t=2024-03-01T03%3A28%3A35.565Z';
                                                                            } else if (listPessoasItem.aplicativoDaCartela ==
                                                                                4) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020558_0000.png';
                                                                            } else {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020515_0000.png';
                                                                            }
                                                                          }(),
                                                                          width:
                                                                              32.0,
                                                                          height:
                                                                              32.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                listPessoasItem.nome,
                                                                                'Sem Nome',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              functions.nomedoBingo(listPessoasItem.aplicativoDaCartela!),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listPessoasItem.intervalo.first.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    ' - ',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listPessoasItem.intervalo.last.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final listPessoas = functions
                                                                .cartelasComIds(
                                                                    dropdown11UserListUsuarioNoSorteioRowList
                                                                        .toList(),
                                                                    ([
                                                                      4
                                                                    ]).toList())
                                                                ?.toList() ??
                                                            [];
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: listPessoas
                                                              .length,
                                                          itemBuilder: (context,
                                                              listPessoasIndex) {
                                                            final listPessoasItem =
                                                                listPessoas[
                                                                    listPessoasIndex];
                                                            return AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      150),
                                                              curve: Curves
                                                                  .easeInOut,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                        child: Image
                                                                            .network(
                                                                          () {
                                                                            if (listPessoasItem.aplicativoDaCartela ==
                                                                                1) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020341_0000.png';
                                                                            } else if (listPessoasItem.aplicativoDaCartela ==
                                                                                2) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/Design%20sem%20nome%20(2)%20(1).png?t=2024-03-01T03%3A28%3A35.565Z';
                                                                            } else if (listPessoasItem.aplicativoDaCartela ==
                                                                                4) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020558_0000.png';
                                                                            } else {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020515_0000.png';
                                                                            }
                                                                          }(),
                                                                          width:
                                                                              32.0,
                                                                          height:
                                                                              32.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                listPessoasItem.nome,
                                                                                'Sem Nome',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              functions.nomedoBingo(listPessoasItem.aplicativoDaCartela!),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listPessoasItem.intervalo.first.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    ' - ',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listPessoasItem.intervalo.last.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final listPessoas = functions
                                                                .cartelasComIds(
                                                                    dropdown11UserListUsuarioNoSorteioRowList
                                                                        .toList(),
                                                                    ([
                                                                      5
                                                                    ]).toList())
                                                                ?.toList() ??
                                                            [];
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: listPessoas
                                                              .length,
                                                          itemBuilder: (context,
                                                              listPessoasIndex) {
                                                            final listPessoasItem =
                                                                listPessoas[
                                                                    listPessoasIndex];
                                                            return AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      150),
                                                              curve: Curves
                                                                  .easeInOut,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                        child: Image
                                                                            .network(
                                                                          () {
                                                                            if (listPessoasItem.aplicativoDaCartela ==
                                                                                1) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020341_0000.png';
                                                                            } else if (listPessoasItem.aplicativoDaCartela ==
                                                                                2) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/Design%20sem%20nome%20(2)%20(1).png?t=2024-03-01T03%3A28%3A35.565Z';
                                                                            } else if (listPessoasItem.aplicativoDaCartela ==
                                                                                4) {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020558_0000.png';
                                                                            } else {
                                                                              return 'https://nerrggcqrzinmqokfdwh.supabase.co/storage/v1/object/public/img/20240301_020515_0000.png';
                                                                            }
                                                                          }(),
                                                                          width:
                                                                              32.0,
                                                                          height:
                                                                              32.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                listPessoasItem.nome,
                                                                                'Sem Nome',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              functions.nomedoBingo(listPessoasItem.aplicativoDaCartela!),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listPessoasItem.intervalo.first.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    ' - ',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listPessoasItem.intervalo.last.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (indexSorteioRow!.encerrado!) {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: ErroMsmWidget(
                                                  msm:
                                                      'A compra de cartelas foi encerrada!',
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        context.pushNamed('selectCartela');
                                      }
                                    },
                                    text: 'Entrar na Lista',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 40.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).warning,
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
