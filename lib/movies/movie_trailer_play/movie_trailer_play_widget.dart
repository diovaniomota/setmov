import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'movie_trailer_play_model.dart';
export 'movie_trailer_play_model.dart';

/// Assistir o filme
class MovieTrailerPlayWidget extends StatefulWidget {
  const MovieTrailerPlayWidget({
    super.key,
    required this.movieId,
  });

  final int? movieId;

  static String routeName = 'Movie_TrailerPlay';
  static String routePath = '/movieTrailerPlay';

  @override
  State<MovieTrailerPlayWidget> createState() => _MovieTrailerPlayWidgetState();
}

class _MovieTrailerPlayWidgetState extends State<MovieTrailerPlayWidget> {
  late MovieTrailerPlayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieTrailerPlayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MoviesRow>>(
      future: MoviesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.movieId,
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
        List<MoviesRow> movieTrailerPlayMoviesRowList = snapshot.data!;

        final movieTrailerPlayMoviesRow =
            movieTrailerPlayMoviesRowList.isNotEmpty
                ? movieTrailerPlayMoviesRowList.first
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
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              movieTrailerPlayMoviesRow?.coverUrl,
                              'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/capa/Artboard%201.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvY2FwYS9BcnRib2FyZCAxLnBuZyIsImlhdCI6MTc1NzM0NTE1MiwiZXhwIjo0OTEwOTQ1MTUyfQ.Qn9q4oTyv0EX7RfLwkmTFA9so-FWO5bdT-AYbx2V_dw',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xD9191A1F),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    MovieDetailsWidget.routeName,
                                    queryParameters: {
                                      'movieId': serializeParam(
                                        widget.movieId,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Icon(
                                  FFIcons.karrowLeft44,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 30.0,
                                ),
                              ),
                              Icon(
                                Icons.cast_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 24.0, 15.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 80.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                movieTrailerPlayMoviesRow?.title,
                                'Não há',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 36.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowWebView(
                                content: valueOrDefault<String>(
                                  movieTrailerPlayMoviesRow?.trailerUrl,
                                  'Não há',
                                ),
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                verticalScroll: false,
                                horizontalScroll: false,
                                html: true,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
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
