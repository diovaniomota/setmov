import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'movie_item_model.dart';
export 'movie_item_model.dart';

class MovieItemWidget extends StatefulWidget {
  const MovieItemWidget({
    super.key,
    String? poster,
    required this.ratings,
    required this.movieId,
    bool? isRatingVisible,
  })  : this.poster = poster ??
            'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/capa/Artboard%201.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvY2FwYS9BcnRib2FyZCAxLnBuZyIsImlhdCI6MTc1NzM0NTE1MiwiZXhwIjo0OTEwOTQ1MTUyfQ.Qn9q4oTyv0EX7RfLwkmTFA9so-FWO5bdT-AYbx2V_dw',
        this.isRatingVisible = isRatingVisible ?? true;

  final String poster;
  final double? ratings;
  final int? movieId;
  final bool isRatingVisible;

  @override
  State<MovieItemWidget> createState() => _MovieItemWidgetState();
}

class _MovieItemWidgetState extends State<MovieItemWidget> {
  late MovieItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieItemModel());

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
      width: 142.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Container(
              width: () {
                if (MediaQuery.sizeOf(context).width > 413.0) {
                  return 187.0;
                } else if (MediaQuery.sizeOf(context).width > 399.0) {
                  return 180.0;
                } else if (MediaQuery.sizeOf(context).width > 389.0) {
                  return 175.0;
                } else if (MediaQuery.sizeOf(context).width > 379.0) {
                  return 170.0;
                } else if (MediaQuery.sizeOf(context).width > 369.0) {
                  return 165.0;
                } else if (MediaQuery.sizeOf(context).width > 359.0) {
                  return 160.0;
                } else if (MediaQuery.sizeOf(context).width > 349.0) {
                  return 155.0;
                } else if (MediaQuery.sizeOf(context).width > 339.0) {
                  return 150.0;
                } else if (MediaQuery.sizeOf(context).width > 329.0) {
                  return 145.0;
                } else if (MediaQuery.sizeOf(context).width > 319.0) {
                  return 140.0;
                } else if (MediaQuery.sizeOf(context).width > 309.0) {
                  return 135.0;
                } else {
                  return 310.0;
                }
              }(),
              height: 200.0,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.poster,
                        'https://supabase.konexapp.com.br/storage/v1/object/sign/storagesetmovie/capa/Artboard%201.png?token=eyJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzdG9yYWdlc2V0bW92aWUvY2FwYS9BcnRib2FyZCAxLnBuZyIsImlhdCI6MTc1NzM0NTE1MiwiZXhwIjo0OTEwOTQ1MTUyfQ.Qn9q4oTyv0EX7RfLwkmTFA9so-FWO5bdT-AYbx2V_dw',
                      ),
                      width: 154.0,
                      height: 246.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (widget.isRatingVisible)
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 14.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              () {
                                if (widget.ratings == 1.0) {
                                  return 'https://supabase.konexapp.com.br/storage/v1/object/public/storagesetmovie/rating/ratting_1.png';
                                } else if (widget.ratings == 2.0) {
                                  return 'https://supabase.konexapp.com.br/storage/v1/object/public/storagesetmovie/rating/ratting_2.png';
                                } else if (widget.ratings == 3.0) {
                                  return 'https://supabase.konexapp.com.br/storage/v1/object/public/storagesetmovie/rating/ratting_3.png';
                                } else if (widget.ratings == 4.0) {
                                  return 'https://supabase.konexapp.com.br/storage/v1/object/public/storagesetmovie/rating/ratting_4.png';
                                } else {
                                  return 'https://supabase.konexapp.com.br/storage/v1/object/public/storagesetmovie/rating/ratting_5.png';
                                }
                              }(),
                              'https://supabase.konexapp.com.br/storage/v1/object/public/storagesetmovie/rating/ratting_1.png',
                            ),
                            height: 18.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            width: 86.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Locar',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
            ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
