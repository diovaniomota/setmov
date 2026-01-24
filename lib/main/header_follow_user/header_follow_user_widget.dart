import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header_follow_user_model.dart';
export 'header_follow_user_model.dart';

class HeaderFollowUserWidget extends StatefulWidget {
  const HeaderFollowUserWidget({
    super.key,
    required this.followedId,
  });

  final String? followedId;

  @override
  State<HeaderFollowUserWidget> createState() => _HeaderFollowUserWidgetState();
}

class _HeaderFollowUserWidgetState extends State<HeaderFollowUserWidget> {
  late HeaderFollowUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderFollowUserModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.querfollows = await UserFollowsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'follower_id',
              currentUserUid,
            )
            .eqOrNull(
              'followed_id',
              widget.followedId,
            ),
      );
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
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        decoration: BoxDecoration(),
        child: FutureBuilder<List<UsersRow>>(
          future: UsersTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.followedId,
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

            final rowUsersRow =
                rowUsersRowList.isNotEmpty ? rowUsersRowList.first : null;

            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(RedeSocialHomeWidget.routeName);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            RedeSocialMinhaWidget.routeName,
                            queryParameters: {
                              'userId': serializeParam(
                                currentUserUid,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: 56.0,
                          height: 56.0,
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
                                errorBuilder: (context, error, stackTrace) =>
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
                      ),
                      Text(
                        '${rowUsersRow?.firstName} ${rowUsersRow?.lastName}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
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
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
                FutureBuilder<List<UserFollowsRow>>(
                  future: (_model.requestCompleter ??=
                          Completer<List<UserFollowsRow>>()
                            ..complete(UserFollowsTable().querySingleRow(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'follower_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'followed_id',
                                    widget.followedId,
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
                    List<UserFollowsRow> conditionalBuilderUserFollowsRowList =
                        snapshot.data!;

                    return Builder(
                      builder: (context) {
                        if (_model.querfollows?.firstOrNull == null) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await UserFollowsTable().insert({
                                'follower_id': currentUserUid,
                                'followed_id': widget.followedId,
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/icon.png',
                                width: 32.0,
                                height: 32.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await UserFollowsTable().delete(
                                  matchingRows: (rows) => rows
                                      .eqOrNull(
                                        'follower_id',
                                        currentUserUid,
                                      )
                                      .eqOrNull(
                                        'followed_id',
                                        widget.followedId,
                                      ),
                                );
                                safeSetState(
                                    () => _model.requestCompleter = null);
                                await _model.waitForRequestCompleted();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.remove,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
