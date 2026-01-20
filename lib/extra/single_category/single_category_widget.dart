import '/components/back_button/back_button_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/movies/movie_item2/movie_item2_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_category_model.dart';
export 'single_category_model.dart';

class SingleCategoryWidget extends StatefulWidget {
  const SingleCategoryWidget({super.key});

  static String routeName = 'SingleCategory';
  static String routePath = '/singleCategory';

  @override
  State<SingleCategoryWidget> createState() => _SingleCategoryWidgetState();
}

class _SingleCategoryWidgetState extends State<SingleCategoryWidget> {
  late SingleCategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleCategoryModel());

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
                  Text(
                    'Os 10  filmes desta semana',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(ExploreWidget.routeName);
                },
                child: wrapWithModel(
                  model: _model.searchIconBtnModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SearchIconBtnWidget(),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 20.0,
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        wrapWithModel(
                          model: _model.movieItem2Model1,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/wish_pzsuqllw_500x749.jpg?v=1696430410',
                            ratings: 9.2,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model2,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/the-super-mario-bros-movie_wfuto8pj_500x749.jpg?v=1681236594',
                            ratings: 9.7,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model3,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/deadpool-wolverine_866a70e7-fb48-4f35-a44b-41594691ac76_500x749.jpg?v=1724680738',
                            ratings: 9.4,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model4,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/red_one_ver2_500x749.jpg?v=1727895592',
                            ratings: 9.0,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model5,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/wild_robot_ver2_500x749.jpg?v=1718830597',
                            ratings: 10.0,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model6,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/wicked_ver5_500x749.jpg?v=1725983333',
                            ratings: 8.9,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model7,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/inside_out_two_ver2_500x749.jpg?v=1711998871',
                            ratings: 9.8,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model8,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/9bd3af42811e308f3f907b723539ce40_49e1d1d6-e6ee-48f0-92d3-331cfbd49b52_500x749.jpg?v=1573588749',
                            ratings: 9.5,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model9,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/kingdom-of-the-planet-of-the-apes_izhauws1_500x749.jpg?v=1703090983',
                            ratings: 9.7,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.movieItem2Model10,
                          updateCallback: () => safeSetState(() {}),
                          child: MovieItem2Widget(
                            poster:
                                'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/dune_1biov8fc_500x749.jpg?v=1646844597',
                            ratings: 9.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 30.0))
                    .addToStart(SizedBox(height: 15.0))
                    .addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
