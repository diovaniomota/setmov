import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'comment_card_model.dart';
export 'comment_card_model.dart';

class CommentCardWidget extends StatefulWidget {
  const CommentCardWidget({
    super.key,
    int? movieId,
    required this.commentId,
    required this.displayName,
    required this.comment,
    required this.date,
    bool? isLiked,
    bool? isFollow,
    this.imagePath,
    required this.userId,
  })  : this.movieId = movieId ?? 1,
        this.isLiked = isLiked ?? false,
        this.isFollow = isFollow ?? false;

  final int movieId;
  final int? commentId;
  final String? displayName;
  final String? comment;
  final DateTime? date;
  final bool isLiked;
  final bool isFollow;
  final String? imagePath;
  final String? userId;

  @override
  State<CommentCardWidget> createState() => _CommentCardWidgetState();
}

class _CommentCardWidgetState extends State<CommentCardWidget> {
  late CommentCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.query = await CommentLikesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              widget.userId,
            )
            .eqOrNull(
              'comment_id',
              widget.commentId,
            ),
      );
      if (_model.query != null && (_model.query)!.isNotEmpty) {
        _model.liked = true;
        safeSetState(() {});
      } else {
        _model.liked = false;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.imagePath,
                              'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/avatar/4.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvYXZhdGFyLzQucG5nIiwiaWF0IjoxNzU4NzEzNjEzLCJleHAiOjQ5MTIzMTM2MTN9.J54Igz3BhBOWpLp8dMZXuuD2EiVFI_8VIz3s3r9ubBI',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              RedeSocialProfileWidget.routeName,
                              queryParameters: {
                                'currentProfileId': serializeParam(
                                  widget.userId,
                                  ParamType.String,
                                ),
                                'followedId': serializeParam(
                                  widget.userId,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.displayName,
                                    'Nome Sobrenome',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget.isFollow) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon.png',
                          width: 26.0,
                          height: 26.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.comment,
                  '-',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<List<CommentLikesRow>>(
                  future: CommentLikesTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'user_id',
                          widget.userId,
                        )
                        .eqOrNull(
                          'comment_id',
                          widget.commentId,
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
                    List<CommentLikesRow> container23CommentLikesRowList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            FutureBuilder<List<CommentLikesRow>>(
                              future: (_model.requestCompleter ??=
                                      Completer<List<CommentLikesRow>>()
                                        ..complete(
                                            CommentLikesTable().querySingleRow(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'user_id',
                                                widget.userId,
                                              )
                                              .eqOrNull(
                                                'comment_id',
                                                widget.commentId,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CommentLikesRow>
                                    containerCommentLikesRowList =
                                    snapshot.data!;

                                final containerCommentLikesRow =
                                    containerCommentLikesRowList.isNotEmpty
                                        ? containerCommentLikesRowList.first
                                        : null;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((containerCommentLikesRow?.userId !=
                                                  null &&
                                              containerCommentLikesRow
                                                      ?.userId !=
                                                  '') &&
                                          (containerCommentLikesRow
                                                  ?.commentId !=
                                              null))
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await CommentLikesTable().delete(
                                              matchingRows: (rows) => rows
                                                  .eqOrNull(
                                                    'user_id',
                                                    widget.userId,
                                                  )
                                                  .eqOrNull(
                                                    'comment_id',
                                                    widget.commentId,
                                                  ),
                                            );
                                            _model.liked = false;
                                            safeSetState(() {});
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                          },
                                          child: Icon(
                                            FFIcons.kheart04,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      if ((containerCommentLikesRow
                                                  ?.commentId ==
                                              null) &&
                                          (containerCommentLikesRow?.userId ==
                                                  null ||
                                              containerCommentLikesRow
                                                      ?.userId ==
                                                  ''))
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await CommentLikesTable().insert({
                                              'user_id': currentUserUid,
                                              'comment_id': widget.commentId,
                                            });
                                            _model.liked = true;
                                            safeSetState(() {});
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                          },
                                          child: Icon(
                                            FFIcons.kheart3,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ToggleIcon(
                            onPressed: () async {
                              safeSetState(() => _model.liked = !_model.liked);
                              if (_model.liked == false) {
                                await CommentLikesTable().delete(
                                  matchingRows: (rows) => rows
                                      .eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      )
                                      .eqOrNull(
                                        'comment_id',
                                        widget.commentId,
                                      ),
                                );
                                _model.liked = false;
                                safeSetState(() {});
                                return;
                              } else {
                                await CommentLikesTable().insert({
                                  'user_id': currentUserUid,
                                  'comment_id': widget.commentId,
                                });
                                _model.liked = true;
                                safeSetState(() {});
                                return;
                              }
                            },
                            value: _model.liked,
                            onIcon: Icon(
                              Icons.favorite_rounded,
                              color: Color(0xFF7C25BC),
                              size: 24.0,
                            ),
                            offIcon: Icon(
                              FFIcons.kheart3,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: FutureBuilder<List<CommentLikeCountRow>>(
                              future: CommentLikeCountTable().querySingleRow(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'movie_id',
                                      widget.movieId,
                                    )
                                    .eqOrNull(
                                      'comment_id',
                                      widget.commentId,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CommentLikeCountRow>
                                    textCommentLikeCountRowList =
                                    snapshot.data!;

                                final textCommentLikeCountRow =
                                    textCommentLikeCountRowList.isNotEmpty
                                        ? textCommentLikeCountRowList.first
                                        : null;

                                return Text(
                                  valueOrDefault<String>(
                                    textCommentLikeCountRow?.totalLikes
                                        ?.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      "relative",
                      widget.date,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'há alguns segundos',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
