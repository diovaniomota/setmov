import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/header/header_widget.dart';
import '/main/navbar/navbar_widget.dart';
import '/rede_social/feed_card/feed_card_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rede_social_minha_model.dart';
export 'rede_social_minha_model.dart';

class RedeSocialMinhaWidget extends StatefulWidget {
  const RedeSocialMinhaWidget({
    super.key,
    required this.userId,
  });

  final String? userId;

  static String routeName = 'RedeSocial_Minha';
  static String routePath = '/redesSocialMinha2';

  @override
  State<RedeSocialMinhaWidget> createState() => _RedeSocialMinhaWidgetState();
}

class _RedeSocialMinhaWidgetState extends State<RedeSocialMinhaWidget> {
  late RedeSocialMinhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedeSocialMinhaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.userId,
        ),
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
        List<UsersRow> redeSocialMinhaUsersRowList = snapshot.data!;

        final redeSocialMinhaUsersRow = redeSocialMinhaUsersRowList.isNotEmpty
            ? redeSocialMinhaUsersRowList.first
            : null;

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
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 15.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.headerModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: HeaderWidget(
                                              userid: currentUserUid,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
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
                                              highlightColor:
                                                  Colors.transparent,
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
                                                  List<
                                                      ViewUserFollowingWithAvatarRow>>(
                                                future:
                                                    ViewUserFollowingWithAvatarTable()
                                                        .queryRows(
                                                  queryFn: (q) => q,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ViewUserFollowingWithAvatarRow>
                                                      rowViewUserFollowingWithAvatarRowList =
                                                      snapshot.data!;

                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                          rowViewUserFollowingWithAvatarRowList
                                                              .length,
                                                          (rowIndex) {
                                                        final rowViewUserFollowingWithAvatarRow =
                                                            rowViewUserFollowingWithAvatarRowList[
                                                                rowIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              RedeSocialProfileWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentProfileId':
                                                                    serializeParam(
                                                                  rowViewUserFollowingWithAvatarRow
                                                                      .followerId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'followedId':
                                                                    serializeParam(
                                                                  rowViewUserFollowingWithAvatarRow
                                                                      .followedId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 64.0,
                                                            height: 64.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowViewUserFollowingWithAvatarRow
                                                                    .imagemPerfil,
                                                                'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/avatar/4.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvYXZhdGFyLzQucG5nIiwiaWF0IjoxNzU4NzEzNjEzLCJleHAiOjQ5MTIzMTM2MTN9.J54Igz3BhBOWpLp8dMZXuuD2EiVFI_8VIz3s3r9ubBI',
                                                              ),
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Meus Comentários',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 20.0)),
                                    ),
                                    FutureBuilder<List<ViewAllCommentsRow>>(
                                      future: ViewAllCommentsTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'user_id',
                                          currentUserUid,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
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
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewAllCommentsRowList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewViewAllCommentsRow =
                                                listViewViewAllCommentsRowList[
                                                    listViewIndex];
                                            return FeedCardWidget(
                                              key: Key(
                                                  'Key74z_${listViewIndex}_of_${listViewViewAllCommentsRowList.length}'),
                                              userId: widget.userId!,
                                              moveid: listViewViewAllCommentsRow
                                                  .movieId!,
                                              urlMovie:
                                                  listViewViewAllCommentsRow
                                                      .movieCover!,
                                              descricao:
                                                  listViewViewAllCommentsRow
                                                      .commentText!,
                                              like: listViewViewAllCommentsRow
                                                  .totalLikes!,
                                              comentID:
                                                  listViewViewAllCommentsRow
                                                      .commentId!,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20.0))
                                      .addToEnd(SizedBox(height: 0.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavbarWidget(),
                      ),
                    ],
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
