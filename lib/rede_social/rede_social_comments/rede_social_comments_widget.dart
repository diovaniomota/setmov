import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/rede_social/comment_card/comment_card_widget.dart';
import '/components/success_dialogsem_action/success_dialogsem_action_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rede_social_comments_model.dart';
export 'rede_social_comments_model.dart';

class RedeSocialCommentsWidget extends StatefulWidget {
  const RedeSocialCommentsWidget({
    super.key,
    required this.movieId,
  });

  final int? movieId;

  static String routeName = 'RedeSocial_Comments';
  static String routePath = '/movieComments';

  @override
  State<RedeSocialCommentsWidget> createState() =>
      _RedeSocialCommentsWidgetState();
}

class _RedeSocialCommentsWidgetState extends State<RedeSocialCommentsWidget> {
  late RedeSocialCommentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedeSocialCommentsModel());

    _model.tFComentarioTextController ??= TextEditingController();
    _model.tFComentarioFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieRentalsRow>>(
      future: MovieRentalsTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'movie_id',
              widget.movieId,
            )
            .order('rented_at'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MovieRentalsRow> redeSocialCommentsMovieRentalsRowList =
            snapshot.data!;

        final redeSocialCommentsMovieRentalsRow =
            redeSocialCommentsMovieRentalsRowList.isNotEmpty
                ? redeSocialCommentsMovieRentalsRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.backButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BackButtonWidget(),
                      ),
                      FutureBuilder<List<MovieCommentsRow>>(
                        future: (_model.requestCompleter2 ??=
                                Completer<List<MovieCommentsRow>>()
                                  ..complete(MovieCommentsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'movie_id',
                                      widget.movieId,
                                    ),
                                  )))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<MovieCommentsRow> textMovieCommentsRowList =
                              snapshot.data!;

                          return Text(
                            valueOrDefault<String>(
                              'Comentários ( ${textMovieCommentsRowList.length.toString()} )',
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  wrapWithModel(
                    model: _model.searchIconBtnModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SearchIconBtnWidget(),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FutureBuilder<List<CommentWithUserRow>>(
                      future: (_model.requestCompleter1 ??=
                              Completer<List<CommentWithUserRow>>()
                                ..complete(CommentWithUserTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'movie_id',
                                        widget.movieId,
                                      )
                                      .order('created_at'),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CommentWithUserRow>
                            listViewCommentWithUserRowList = snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            12.0,
                            0,
                            12.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCommentWithUserRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewCommentWithUserRow =
                                listViewCommentWithUserRowList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: CommentCardWidget(
                                key: Key(
                                    'Keybwy_${listViewIndex}_of_${listViewCommentWithUserRowList.length}'),
                                movieId: listViewCommentWithUserRow.movieId!,
                                commentId:
                                    listViewCommentWithUserRow.commentId!,
                                displayName:
                                    '${listViewCommentWithUserRow.firstName} ${listViewCommentWithUserRow.lastName}',
                                comment: listViewCommentWithUserRow.comment!,
                                date: listViewCommentWithUserRow.createdAt!,
                                isFollow: false,
                                imagePath:
                                    listViewCommentWithUserRow.imagemPerfil,
                                userId: listViewCommentWithUserRow.userId!,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  if (currentUserUid != '')
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: FutureBuilder<List<MovieCommentsRow>>(
                        future: MovieCommentsTable().querySingleRow(
                          queryFn: (q) => q
                              .eqOrNull(
                                'rental_id',
                                redeSocialCommentsMovieRentalsRow?.id,
                              )
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
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
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<MovieCommentsRow> containerMovieCommentsRowList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 0.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 55.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .tFComentarioTextController,
                                            focusNode:
                                                _model.tFComentarioFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText:
                                                  'Digite um comentário...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .tFComentarioTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => Icon(
                                        Icons.remove_rounded,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        size: 15.0,
                                      ),
                                      incrementIconBuilder: (enabled) => Icon(
                                        Icons.add_rounded,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        size: 15.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      count: _model.countControllerValue ??= 0,
                                      updateCount: (count) => safeSetState(() =>
                                          _model.countControllerValue = count),
                                      stepSize: 1,
                                      minimum: 0,
                                      maximum: 5,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 5.0, 0.0),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (redeSocialCommentsMovieRentalsRow ==
                                          null) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child:
                                                    SuccessDialogsemActionWidget(
                                                  title: 'Atenção',
                                                  shortDesc:
                                                      'É permitido comentar somente se alugar o filme.',
                                                  doneText: 'Entendi',
                                                  successIcon: Icon(
                                                    Icons.lock_outline_rounded,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        return;
                                      }

                                      final movieHistoryList =
                                          await MovieHistoryTable()
                                              .querySingleRow(
                                        queryFn: (q) => q
                                            .eq('user_id', currentUserUid)
                                            .eqOrNull(
                                                'movie_id', widget.movieId),
                                      );

                                      bool hasWatchedEnough = false;
                                      if (movieHistoryList.isNotEmpty) {
                                        final history = movieHistoryList.first;
                                        final watched =
                                            history.watchedDuration ?? 0;
                                        final total =
                                            history.totalDuration ?? 1;
                                        if (total > 0 &&
                                            (watched / total) >= 0.7) {
                                          hasWatchedEnough = true;
                                        }
                                      }

                                      if (!hasWatchedEnough) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child:
                                                    SuccessDialogsemActionWidget(
                                                  title: 'Atenção',
                                                  shortDesc:
                                                      'Você precisa assistir a pelo menos 70% do filme para comentar.',
                                                  doneText: 'Entendi',
                                                  successIcon: Icon(
                                                    Icons
                                                        .play_circle_outline_rounded,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        return;
                                      }

                                      await MovieCommentsTable().insert({
                                        'user_id': currentUserUid,
                                        'movie_id': widget.movieId,
                                        'comment': _model
                                            .tFComentarioTextController.text,
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'rental_id':
                                            redeSocialCommentsMovieRentalsRow
                                                .id,
                                      });
                                      safeSetState(() =>
                                          _model.requestCompleter1 = null);
                                      await _model.waitForRequestCompleted1();
                                      safeSetState(() =>
                                          _model.requestCompleter2 = null);
                                      await _model.waitForRequestCompleted2();
                                      safeSetState(() {
                                        _model.tFComentarioTextController
                                            ?.clear();
                                      });
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            Color(0xFFF93948)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FFIcons.ksend240,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
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
        );
      },
    );
  }
}
