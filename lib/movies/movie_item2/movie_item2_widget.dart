import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'movie_item2_model.dart';
export 'movie_item2_model.dart';

class MovieItem2Widget extends StatefulWidget {
  const MovieItem2Widget({
    super.key,
    required this.poster,
    required this.ratings,
  });

  final String? poster;
  final double? ratings;

  @override
  State<MovieItem2Widget> createState() => _MovieItem2WidgetState();
}

class _MovieItem2WidgetState extends State<MovieItem2Widget> {
  late MovieItem2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieItem2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              0,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      },
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
        height: 248.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                widget.poster!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.8),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        height: 15.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        alignment: AlignmentDirectional(1.0, 1.0),
                      ),
                    ),
                    if (widget.ratings != null)
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
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
