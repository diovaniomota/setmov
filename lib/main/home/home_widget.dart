import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/interest_item/interest_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/header/header_widget.dart';
import '/main/navbar/navbar_widget.dart';
import '/movies/movie_item/movie_item_widget.dart';
import '/flutter_flow/custom_functions.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          userid: currentUserUid,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
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
                              onTap: () async {
                                context
                                    .pushNamed(RedeSocialHomeWidget.routeName);
                              },
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
                                  List<ViewUserFollowingWithAvatarRow>>(
                                future: ViewUserFollowingWithAvatarTable()
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
                                  List<ViewUserFollowingWithAvatarRow>
                                      listViewViewUserFollowingWithAvatarRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewViewUserFollowingWithAvatarRowList
                                            .length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewViewUserFollowingWithAvatarRow =
                                          listViewViewUserFollowingWithAvatarRowList[
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
                                                listViewViewUserFollowingWithAvatarRow
                                                    .followerId,
                                                ParamType.String,
                                              ),
                                              'followedId': serializeParam(
                                                listViewViewUserFollowingWithAvatarRow
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
                                          child: Builder(
                                            builder: (context) {
                                              return Image.network(
                                                getAvatarPath(
                                                  listViewViewUserFollowingWithAvatarRow
                                                      .imagemPerfil,
                                                  listViewViewUserFollowingWithAvatarRow
                                                      .followedId,
                                                ),
                                                fit: BoxFit.fitWidth,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  getAvatarPath(
                                                    null,
                                                    listViewViewUserFollowingWithAvatarRow
                                                        .followedId,
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              );
                                            },
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
              Expanded(
                child: FutureBuilder<List<MoviesRow>>(
                  future: MoviesTable().queryRows(
                    queryFn: (q) => q.order('created_at'),
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<MoviesRow> containerMoviesRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Text(
                                'RECOMENDADOS',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final moviesRecommended = containerMoviesRowList
                                    .sortedList(
                                        keyOf: (e) => e.avgRating, desc: true)
                                    .toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        List.generate(moviesRecommended.length,
                                                (moviesRecommendedIndex) {
                                      final moviesRecommendedItem =
                                          moviesRecommended[
                                              moviesRecommendedIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            MovieDetailsWidget.routeName,
                                            queryParameters: {
                                              'movieId': serializeParam(
                                                moviesRecommendedItem.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: MovieItemWidget(
                                          key: Key(
                                              'Keyb59_${moviesRecommendedIndex}_of_${moviesRecommended.length}'),
                                          poster:
                                              moviesRecommendedItem.coverUrl!,
                                          ratings: moviesRecommendedItem
                                              .ratingCount
                                              .toDouble(),
                                          movieId: moviesRecommendedItem.id,
                                          isRatingVisible: true,
                                        ),
                                      );
                                    })
                                            .divide(SizedBox(width: 10.0))
                                            .addToStart(SizedBox(width: 15.0)),
                                  ),
                                );
                              },
                            ),
                            if (currentUserEmail == 'thyagoe@gmai.com')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Interesses populares',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            PopularInterestsWidget.routeName);
                                      },
                                      child: Text(
                                        'Ver todos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (currentUserEmail == 'fsdfds@gmail.com')
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    wrapWithModel(
                                      model: _model.interestItemModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InterestItemWidget(
                                        poster:
                                            'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/avengersinfinitywar.styleb.reg.ar_500x749.jpg?v=1594305978',
                                        title: 'Superhero',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.interestItemModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InterestItemWidget(
                                        poster:
                                            'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/luca_uib9wgfd_500x749.jpg?v=1676653030',
                                        title: 'Animation',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.interestItemModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InterestItemWidget(
                                        poster:
                                            'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/lisa-frankenstein_h5reud5q_500x749.jpg?v=1707247438',
                                        title: 'Raunchy Comedy',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.interestItemModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InterestItemWidget(
                                        poster:
                                            'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/joker-folie-a-deux_wltjyy4w_500x749.jpg?v=1727465681',
                                        title: 'Joker',
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 10.0))
                                      .addToStart(SizedBox(width: 15.0)),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lançamento',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          SingleCategoryWidget.routeName);
                                    },
                                    child: Text(
                                      'Ver todos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final moviesNew =
                                    containerMoviesRowList.toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(moviesNew.length,
                                            (moviesNewIndex) {
                                      final moviesNewItem =
                                          moviesNew[moviesNewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            MovieDetailsWidget.routeName,
                                            queryParameters: {
                                              'movieId': serializeParam(
                                                moviesNewItem.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: MovieItemWidget(
                                          key: Key(
                                              'Key15h_${moviesNewIndex}_of_${moviesNew.length}'),
                                          poster: moviesNewItem.coverUrl!,
                                          ratings: moviesNewItem.ratingCount
                                              .toDouble(),
                                          movieId: moviesNewItem.id,
                                          isRatingVisible: true,
                                        ),
                                      );
                                    })
                                        .divide(SizedBox(width: 10.0))
                                        .addToStart(SizedBox(width: 15.0)),
                                  ),
                                );
                              },
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Selecionado para você',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              SingleCategoryWidget.routeName);
                                        },
                                        child: Text(
                                          'Ver todos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final moviesSelected =
                                        containerMoviesRowList
                                            .sortedList(
                                                keyOf: (e) => e.rentalPrice!,
                                                desc: false)
                                            .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                                moviesSelected.length,
                                                (moviesSelectedIndex) {
                                          final moviesSelectedItem =
                                              moviesSelected[
                                                  moviesSelectedIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                MovieDetailsWidget.routeName,
                                                queryParameters: {
                                                  'movieId': serializeParam(
                                                    moviesSelectedItem.id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: MovieItemWidget(
                                              key: Key(
                                                  'Keyffo_${moviesSelectedIndex}_of_${moviesSelected.length}'),
                                              poster:
                                                  moviesSelectedItem.coverUrl!,
                                              ratings: moviesSelectedItem
                                                  .ratingCount
                                                  .toDouble(),
                                              movieId: moviesSelectedItem.id,
                                              isRatingVisible: false,
                                            ),
                                          );
                                        })
                                            .divide(SizedBox(width: 10.0))
                                            .addToStart(SizedBox(width: 15.0)),
                                      ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),

                          ]
                              .divide(SizedBox(height: 20.0))
                              .addToEnd(SizedBox(height: 24.0)),
                        ),
                      ),
                    );
                  },
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
