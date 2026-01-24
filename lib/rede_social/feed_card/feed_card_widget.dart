import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'feed_card_model.dart';
export 'feed_card_model.dart';

class FeedCardWidget extends StatefulWidget {
  const FeedCardWidget({
    super.key,
    this.likeId,
    required this.userId,
    required this.moveid,
    required this.urlMovie,
    required this.descricao,
    required this.like,
    required this.comentID,
  });

  final Widget? likeId;
  final String? userId;
  final int? moveid;
  final String? urlMovie;
  final String? descricao;
  final int? like;
  final int? comentID;

  @override
  State<FeedCardWidget> createState() => _FeedCardWidgetState();
}

class _FeedCardWidgetState extends State<FeedCardWidget> {
  late FeedCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCardModel());

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
              widget.comentID,
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
      width: double.infinity,
      height: 186.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    MovieDetailsWidget.routeName,
                    queryParameters: {
                      'movieId': serializeParam(
                        widget.moveid,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Builder(
                    builder: (context) {
                      final urlMovie = widget.urlMovie;
                      if (urlMovie == null || urlMovie.isEmpty) {
                        return Image.asset(
                          'assets/images/Artboard 1.png',
                          width: 96.0,
                          fit: BoxFit.cover,
                        );
                      }
                      return Image.network(
                        urlMovie,
                        width: 96.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/Artboard 1.png',
                          width: 96.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<UsersRow>>(
                    future: UsersTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull(
                        'id',
                        widget.userId,
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
                      List<UsersRow> rowUsersRowList = snapshot.data!;

                      final rowUsersRow = rowUsersRowList.isNotEmpty
                          ? rowUsersRowList.first
                          : null;

                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 24.0,
                              height: 24.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Builder(
                                builder: (context) {
                                  return Image.network(
                                    getAvatarPath(
                                      rowUsersRow?.imagemPerfil,
                                      rowUsersRow?.id,
                                    ),
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      getAvatarPath(
                                        null,
                                        rowUsersRow?.id,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
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
                                      rowUsersRow?.id,
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
                                        rowUsersRow?.firstName,
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: ' ',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        rowUsersRow?.lastName,
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
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
                                        fontSize: 15.0,
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
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      );
                    },
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ' \"',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: valueOrDefault<String>(
                            widget.descricao,
                            'x',
                          ),
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/rating-removebg-preview.png',
                          width: 80.0,
                          height: 18.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.like.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                              ToggleIcon(
                                onPressed: () async {
                                  safeSetState(
                                      () => _model.liked = !_model.liked);
                                  if (_model.liked == false) {
                                    await CommentLikesTable().delete(
                                      matchingRows: (rows) => rows
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'comment_id',
                                            widget.comentID,
                                          ),
                                    );
                                    _model.liked = false;
                                    safeSetState(() {});
                                    return;
                                  } else {
                                    await CommentLikesTable().insert({
                                      'user_id': currentUserUid,
                                      'comment_id': widget.comentID,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ].divide(SizedBox(width: 24.0)),
        ),
      ),
    );
  }
}
