import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/navbar/navbar_widget.dart';
import '/rede_social/feed_card/feed_card_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rede_social_profile_model.dart';
export 'rede_social_profile_model.dart';

class RedeSocialProfileWidget extends StatefulWidget {
  const RedeSocialProfileWidget({
    super.key,
    this.currentProfileId,
    required this.followedId,
  });

  /// followed_id
  final String? currentProfileId;

  final String? followedId;

  static String routeName = 'RedeSocial_Profile';
  static String routePath = '/redesSocialPerfil2';

  @override
  State<RedeSocialProfileWidget> createState() =>
      _RedeSocialProfileWidgetState();
}

class _RedeSocialProfileWidgetState extends State<RedeSocialProfileWidget> {
  late RedeSocialProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedeSocialProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 0.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: FutureBuilder<List<UserFollowsRow>>(
                          future: (_model.requestCompleter ??=
                                  Completer<List<UserFollowsRow>>()
                                    ..complete(UserFollowsTable().queryRows(
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
                            List<UserFollowsRow>
                                containerFollowUserFollowsRowList =
                                snapshot.data!;

                            return Container(
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRow> rowUsersRowList =
                                      snapshot.data!;

                                  final rowUsersRow = rowUsersRowList.isNotEmpty
                                      ? rowUsersRowList.first
                                      : null;

                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              RedeSocialHomeWidget.routeName);
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  RedeSocialMinhaWidget
                                                      .routeName,
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
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    rowUsersRow?.imagemPerfil,
                                                    'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/avatar/4.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvYXZhdGFyLzQucG5nIiwiaWF0IjoxNzU4NzEzNjEzLCJleHAiOjQ5MTIzMTM2MTN9.J54Igz3BhBOWpLp8dMZXuuD2EiVFI_8VIz3s3r9ubBI',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${rowUsersRow?.firstName} ${rowUsersRow?.lastName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
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
                                                        fontSize: 15.0,
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
                                            ),
                                          ].divide(SizedBox(width: 15.0)),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (containerFollowUserFollowsRowList
                                                  .firstOrNull ==
                                              null) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await UserFollowsTable()
                                                    .insert({
                                                  'follower_id': currentUserUid,
                                                  'followed_id':
                                                      widget.followedId,
                                                });
                                                safeSetState(() => _model
                                                    .requestCompleter = null);
                                                await _model
                                                    .waitForRequestCompleted();
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await UserFollowsTable()
                                                      .delete(
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
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        height: 56.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: Container(
                                width: 64.0,
                                height: 64.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Screenshot_4-removebg-preview.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<
                                  List<ViewUserFollowingWithAvatarByIdRow>>(
                                future: ViewUserFollowingWithAvatarByIdTable()
                                    .queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'follower_id',
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ViewUserFollowingWithAvatarByIdRow>
                                      listViewViewUserFollowingWithAvatarByIdRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewViewUserFollowingWithAvatarByIdRowList
                                            .length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewViewUserFollowingWithAvatarByIdRow =
                                          listViewViewUserFollowingWithAvatarByIdRowList[
                                              listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            RedeSocialProfileWidget.routeName,
                                            queryParameters: {
                                              'currentProfileId':
                                                  serializeParam(
                                                listViewViewUserFollowingWithAvatarByIdRow
                                                    .followedId,
                                                ParamType.String,
                                              ),
                                              'followedId': serializeParam(
                                                listViewViewUserFollowingWithAvatarByIdRow
                                                    .followedId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 64.0,
                                          height: 64.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewViewUserFollowingWithAvatarByIdRow
                                                  .imagemPerfil,
                                              'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/avatar/4.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvYXZhdGFyLzQucG5nIiwiaWF0IjoxNzU4NzEzNjEzLCJleHAiOjQ5MTIzMTM2MTN9.J54Igz3BhBOWpLp8dMZXuuD2EiVFI_8VIz3s3r9ubBI',
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 581.79,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<List<UsersRow>>(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRow> textUsersRowList =
                                    snapshot.data!;

                                final textUsersRow = textUsersRowList.isNotEmpty
                                    ? textUsersRowList.first
                                    : null;

                                return Text(
                                  'Últimos comentários de : ${valueOrDefault<String>(
                                    textUsersRow?.firstName,
                                    'Usuario',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                );
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: FutureBuilder<List<ViewAllCommentsRow>>(
                                  future: ViewAllCommentsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'user_id',
                                      widget.followedId,
                                    ),
                                    limit: 10,
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ViewAllCommentsRow>
                                        listViewViewAllCommentsRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewViewAllCommentsRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewViewAllCommentsRow =
                                            listViewViewAllCommentsRowList[
                                                listViewIndex];
                                        return FeedCardWidget(
                                          key: Key(
                                              'Keyr4w_${listViewIndex}_of_${listViewViewAllCommentsRowList.length}'),
                                          userId: widget.followedId!,
                                          moveid: listViewViewAllCommentsRow
                                              .movieId!,
                                          urlMovie: listViewViewAllCommentsRow
                                              .movieCover!,
                                          descricao: listViewViewAllCommentsRow
                                              .commentText!,
                                          like: listViewViewAllCommentsRow
                                              .totalLikes!,
                                          comentID: listViewViewAllCommentsRow
                                              .commentId!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 24.0)),
                ),
              ),
              wrapWithModel(
                model: _model.navbarModel,
                updateCallback: () => safeSetState(() {}),
                child: NavbarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
