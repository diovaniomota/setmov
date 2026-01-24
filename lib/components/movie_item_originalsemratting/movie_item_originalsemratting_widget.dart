import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'movie_item_originalsemratting_model.dart';
export 'movie_item_originalsemratting_model.dart';

class MovieItemOriginalsemrattingWidget extends StatefulWidget {
  const MovieItemOriginalsemrattingWidget({
    super.key,
    required this.poster,
    required this.ratings,
    required this.movieId,
  });

  final String? poster;
  final double? ratings;
  final int? movieId;

  @override
  State<MovieItemOriginalsemrattingWidget> createState() =>
      _MovieItemOriginalsemrattingWidgetState();
}

class _MovieItemOriginalsemrattingWidgetState
    extends State<MovieItemOriginalsemrattingWidget> {
  late MovieItemOriginalsemrattingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieItemOriginalsemrattingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                valueOrDefault<String>(
                  widget.poster,
                  'https://hwkkrylnqyoerpaiujfq.supabase.co/storage/v1/object/public/storagesetmovie/capa/Artboard%201.png',
                ),
                width: 154.0,
                height: 208.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    MovieDetailsWidget.routeName,
                    queryParameters: {
                      'movieId': serializeParam(
                        valueOrDefault<int>(
                          widget.movieId,
                          1,
                        ),
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'Locar',
                options: FFButtonOptions(
                  height: 20.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF562D83),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
