import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/success_dialog/success_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'confirmacao_de_alugar_filme_model.dart';
export 'confirmacao_de_alugar_filme_model.dart';

class ConfirmacaoDeAlugarFilmeWidget extends StatefulWidget {
  const ConfirmacaoDeAlugarFilmeWidget({
    super.key,
    required this.movieId,
    this.userid,
    this.valor,
  });

  final int? movieId;
  final String? userid;
  final double? valor;

  @override
  State<ConfirmacaoDeAlugarFilmeWidget> createState() =>
      _ConfirmacaoDeAlugarFilmeWidgetState();
}

class _ConfirmacaoDeAlugarFilmeWidgetState
    extends State<ConfirmacaoDeAlugarFilmeWidget> {
  late ConfirmacaoDeAlugarFilmeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmacaoDeAlugarFilmeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você deseja confirmar a locação?',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Text(
                'O player de video fica disponível por 24 horas',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      width: 124.0,
                      height: 36.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x59A1A2A7),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        _model.returnMovieRentals =
                            await MovieRentalsTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'movie_id',
                                widget.movieId,
                              ),
                        );
                        _shouldSetState = true;
                        _model.subtrairValor =
                            await ApisStripeGroup.subtrairvalorCall.call(
                          userId: widget.userid,
                          coins: widget.valor?.toString(),
                        );

                        _shouldSetState = true;
                        if (ApisStripeGroup.subtrairvalorCall.status(
                              (_model.subtrairValor?.jsonBody ?? ''),
                            ) ==
                            true) {
                          if (_model.returnMovieRentals != null &&
                              (_model.returnMovieRentals)!.isNotEmpty) {
                            _model.returnUpdRental =
                                await MovieRentalsTable().update(
                              data: {
                                'rented_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'expires_at': supaSerialize<DateTime>(
                                    DateTime.now()
                                        .add(const Duration(hours: 24))),
                              },
                              matchingRows: (rows) => rows
                                  .eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'movie_id',
                                    widget.movieId,
                                  ),
                              returnRows: true,
                            );
                            _shouldSetState = true;
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: SuccessDialogWidget(
                                      title: 'Locação de Filme',
                                      shortDesc: ApisStripeGroup
                                              .subtrairvalorCall
                                              .message(
                                            (_model.subtrairValor?.jsonBody ??
                                                ''),
                                          ) ??
                                          'Filme locado com sucesso!',
                                      doneText: 'Fechar',
                                      successIcon: Icon(
                                        Icons.check,
                                      ),
                                      doneAction: () async {
                                        context.goNamed(
                                          MoviePlayWidget.routeName,
                                          queryParameters: {
                                            'movieId': serializeParam(
                                              widget.movieId,
                                              ParamType.int,
                                            ),
                                            'img': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'rental': serializeParam(
                                              _model
                                                  .returnUpdRental?.firstOrNull,
                                              ParamType.SupabaseRow,
                                            ),
                                          }.withoutNulls,
                                        );

                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            _model.returnInsertRental =
                                await MovieRentalsTable().insert({
                              'user_id': currentUserUid,
                              'movie_id': widget.movieId,
                              'rented_at':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'expires_at': supaSerialize<DateTime>(
                                  DateTime.now()
                                      .add(const Duration(hours: 24))),
                            });
                            _shouldSetState = true;
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: SuccessDialogWidget(
                                      title: 'Locação de Filme',
                                      shortDesc: ApisStripeGroup
                                              .subtrairvalorCall
                                              .message(
                                            (_model.subtrairValor?.jsonBody ??
                                                ''),
                                          ) ??
                                          'Filme locado com sucesso!',
                                      doneText: 'Fechar',
                                      successIcon: Icon(
                                        Icons.check,
                                      ),
                                      doneAction: () async {
                                        context.goNamed(
                                          MoviePlayWidget.routeName,
                                          queryParameters: {
                                            'movieId': serializeParam(
                                              widget.movieId,
                                              ParamType.int,
                                            ),
                                            'img': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'rental': serializeParam(
                                              _model.returnInsertRental,
                                              ParamType.SupabaseRow,
                                            ),
                                          }.withoutNulls,
                                        );

                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: SuccessDialogWidget(
                                    title: 'Locação de Filme',
                                    shortDesc: ApisStripeGroup.subtrairvalorCall
                                            .message(
                                          (_model.subtrairValor?.jsonBody ??
                                              ''),
                                        ) ??
                                        (_model.subtrairValor?.jsonBody
                                                ?.toString() ??
                                            'Não foi possível realizar a locação. Verifique sua conexão ou saldo.'),
                                    doneText: 'Fechar',
                                    successIcon: Icon(
                                      Icons.close_sharp,
                                    ),
                                    doneAction: () async {
                                      context.pushNamed(
                                          PaymentSummaryCopyWidget.routeName);

                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'Confirmar',
                      options: FFButtonOptions(
                        width: 124.0,
                        height: 36.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x59A1A2A7),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 20.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
