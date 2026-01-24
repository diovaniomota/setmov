import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/movies/movie_item2/movie_item2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_list_locados_model.dart';
export 'my_list_locados_model.dart';

class MyListLocadosWidget extends StatefulWidget {
  const MyListLocadosWidget({super.key});

  static String routeName = 'MyListLocados';
  static String routePath = '/myListLocados';

  @override
  State<MyListLocadosWidget> createState() => _MyListLocadosWidgetState();
}

class _MyListLocadosWidgetState extends State<MyListLocadosWidget> {
  late MyListLocadosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyListLocadosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 36.0,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/bullet.png',
                      width: 36.0,
                      height: 36.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Locados',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
              Opacity(
                opacity: 0.0,
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
          toolbarHeight: 86.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!FFAppState().maintenance)
                        FlutterFlowChoiceChips(
                          options: [
                            ChipData('Todas  Categorias'),
                            ChipData('Movie'),
                            ChipData('TV Show'),
                            ChipData('K-Drama'),
                            ChipData('Anime'),
                            ChipData('Others')
                          ],
                          onChanged: (val) => safeSetState(
                              () => _model.choiceChipsValue = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 16.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 6.0, 15.0, 6.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Color(0x00000000),
                            textStyle: FlutterFlowTheme.of(context)
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 16.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 6.0, 15.0, 6.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          chipSpacing: 8.0,
                          rowSpacing: 8.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            ['Todas  Categorias'],
                          ),
                          wrapped: false,
                        ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: FutureBuilder<List<MoviesRow>>(
                          future: Future.wait([
                            MovieRentalsTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull('user_id', currentUserUid)
                                  .gt('expires_at',
                                      supaSerialize<DateTime>(DateTime.now()))
                                  .order('rented_at', ascending: false),
                            ),
                          ]).then((results) async {
                            final rentals = results[0] as List<MovieRentalsRow>;
                            if (rentals.isEmpty) return <MoviesRow>[];
                            final movieIds = rentals
                                .map((r) => r.movieId)
                                .where((id) => id != null)
                                .toList();
                            if (movieIds.isEmpty) return <MoviesRow>[];
                            return await MoviesTable().queryRows(
                              queryFn: (q) => q.filter('id', 'in', movieIds),
                            );
                          }),
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
                            List<MoviesRow> wrapMoviesRowList = snapshot.data!;

                            return Wrap(
                              spacing: 12.0,
                              runSpacing: 24.0,
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(wrapMoviesRowList.length,
                                  (wrapIndex) {
                                final wrapMoviesRow =
                                    wrapMoviesRowList[wrapIndex];
                                return MovieItem2Widget(
                                  key: Key(
                                      'Keygs3_${wrapIndex}_of_${wrapMoviesRowList.length}'),
                                  poster: wrapMoviesRow.coverUrl!,
                                  ratings: 9.2,
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 20.0))
                        .addToEnd(SizedBox(height: 24.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
