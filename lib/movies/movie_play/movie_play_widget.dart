import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/success_dialogsem_action/success_dialogsem_action_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'movie_play_model.dart';
export 'movie_play_model.dart';

/// Assistir o filme
class MoviePlayWidget extends StatefulWidget {
  const MoviePlayWidget({
    super.key,
    required this.img,
    required this.movieId,
    required this.rental,
    this.coins,
  });

  final String? img;
  final int? movieId;
  final MovieRentalsRow? rental;
  final double? coins;

  static String routeName = 'Movie_Play';
  static String routePath = '/moviePlay';

  @override
  State<MoviePlayWidget> createState() => _MoviePlayWidgetState();
}

class _MoviePlayWidgetState extends State<MoviePlayWidget> {
  late MoviePlayModel _model;
  int _lastUpdatedSecond = -1;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoviePlayModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.movieRental = widget.rental;
      safeSetState(() {});
      _model.returnUserFavMovies = await MovieFavoritesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'movie_id',
              widget.movieId,
            ),
      );
      _model.favorited = _model.returnUserFavMovies != null &&
          (_model.returnUserFavMovies)!.isNotEmpty;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          safeSetState(() {});
          if (functions.isExpiredRental(
              _model.movieRental!.expiresAt, getCurrentTimestamp)) {
            _model.instantTimer?.cancel();

            context.goNamed(HomeWidget.routeName);

            return;
          } else {
            return;
          }
        },
        startImmediately: true,
      );
    });

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
        List<MoviesRow> moviePlayMoviesRowList = snapshot.data!;

        final moviePlayMoviesRow = moviePlayMoviesRowList.isNotEmpty
            ? moviePlayMoviesRowList.first
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
                              moviePlayMoviesRow?.coverUrl,
                              'https://hwkkrylnqyoerpaiujfq.supabase.co/storage/v1/object/public/storagesetmovie/capa/Artboard%201.png',
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TEMPO: ${_model.movieRental?.expiresAt != null ? functions.diffFromRented(_model.movieRental!.expiresAt) : 'Calculando...'}',
                              style: FlutterFlowTheme.of(context)
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                moviePlayMoviesRow?.title,
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Builder(builder: (context) {
                                final streamUrl =
                                    moviePlayMoviesRow?.streamUrl ?? '';
                                final isHtml = streamUrl.trim().startsWith('<');
                                final isDirectLink = streamUrl
                                        .toLowerCase()
                                        .contains('.mp4') ||
                                    streamUrl.toLowerCase().contains('.mov') ||
                                    streamUrl.toLowerCase().contains('.m3u8') ||
                                    streamUrl.contains('supabase.co') ||
                                    streamUrl.contains('storage.googleapis.com');

                                if (streamUrl == 'Não há' ||
                                    streamUrl.isEmpty) {
                                  return Text(
                                    'Link indisponível',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                  );
                                }

                                if (isHtml) {
                                  return FlutterFlowWebView(
                                    content: streamUrl,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.4,
                                    verticalScroll: true,
                                    horizontalScroll: true,
                                    html: true,
                                  );
                                }

                                if (isDirectLink) {
                                  return FlutterFlowVideoPlayer(
                                    path: Uri.encodeFull(streamUrl),
                                    videoType: VideoType.network,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.4,
                                    autoPlay: true,
                                    looping: false,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                    lazyLoad: false,
                                    onVideoProgress: (position, duration) {
                                      if (position.inSeconds % 10 == 0) {
                                        _updateWatchHistory(position, duration);
                                      }
                                    },
                                  );
                                }

                                // Default to WebView for other links
                                return FlutterFlowWebView(
                                  content: streamUrl,
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                  verticalScroll: true,
                                  horizontalScroll: true,
                                  html: false,
                                );
                              }),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text('AVISO'),
                                                        content: Text(
                                                            'Você deseja adicionar mais 24 horas de locação?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('NÃO'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('SIM'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          _model.returnUpdRental =
                                              await MovieRentalsTable().update(
                                            data: {
                                              'rented_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'expires_at':
                                                  supaSerialize<DateTime>(
                                                      DateTime.now().add(
                                                          const Duration(
                                                              hours: 24))),
                                            },
                                            matchingRows: (rows) => rows
                                                .eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                )
                                                .eqOrNull(
                                                  'movie_id',
                                                  widget.movieId,
                                                ),
                                            returnRows: true,
                                          );
                                          _shouldSetState = true;
                                          _model.valor = await ApisStripeGroup
                                              .subtrairvalorCall
                                              .call(
                                            userId: currentUserUid,
                                            coins: widget.coins?.toString(),
                                          );

                                          _shouldSetState = true;
                                          if (ApisStripeGroup.subtrairvalorCall
                                                  .status(
                                                (_model.valor?.jsonBody ?? ''),
                                              ) ==
                                              true) {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          SuccessDialogsemActionWidget(
                                                        title:
                                                            'Renovação de locação',
                                                        shortDesc: ApisStripeGroup
                                                            .subtrairvalorCall
                                                            .message(
                                                          (_model.valor
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        doneText: 'Fechar',
                                                        successIcon: Icon(
                                                          Icons.check,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.movieRental = _model
                                                .returnUpdRental?.firstOrNull;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          SuccessDialogsemActionWidget(
                                                        title:
                                                            'Renovação de locação',
                                                        shortDesc: ApisStripeGroup
                                                            .subtrairvalorCall
                                                            .message(
                                                          (_model.valor
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        doneText: 'Fechar',
                                                        successIcon: Icon(
                                                          Icons.close,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          return;
                                        }
                                      },
                                      text: 'Estender locação',
                                      icon: Icon(
                                        FFIcons.kwalletMinus23,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                                if (!FFAppState().maintenance)
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 30.0,
                                      buttonSize: 45.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        FFIcons.ksend238,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await Share.share(
                                          'setmov://setmov.com${GoRouterState.of(context).uri.toString()}',
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                      },
                                    ),
                                  ),
                                Builder(
                                  builder: (context) {
                                    if (!_model.favorited) {
                                      return FlutterFlowIconButton(
                                        borderRadius: 30.0,
                                        buttonSize: 45.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        icon: Icon(
                                          Icons.star_border,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.returnFavorite =
                                              await MovieFavoritesTable()
                                                  .insert({
                                            'user_id': currentUserUid,
                                            'movie_id': widget.movieId,
                                            'favorited_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          });
                                          _model.favorited = true;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      );
                                    } else {
                                      return FlutterFlowIconButton(
                                        borderRadius: 30.0,
                                        buttonSize: 45.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        icon: Icon(
                                          Icons.star_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await MovieFavoritesTable().delete(
                                            matchingRows: (rows) => rows
                                                .eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                )
                                                .eqOrNull(
                                                  'movie_id',
                                                  widget.movieId,
                                                ),
                                          );
                                          _model.favorited = false;
                                          safeSetState(() {});
                                        },
                                      );
                                    }
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).primary,
                                        Color(0xFFF93948)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, 0.0),
                                      end: AlignmentDirectional(-1.0, 0),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ].divide(SizedBox(width: 15.0)),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
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

  Future<void> _updateWatchHistory(Duration position, Duration duration) async {
    // Evitar updates frequentes
    if (_lastUpdatedSecond == position.inSeconds) return;
    _lastUpdatedSecond = position.inSeconds;

    // Verificar se já existe registro
    final existing = await MovieHistoryTable().querySingleRow(
      queryFn: (q) =>
          q.eq('user_id', currentUserUid).eqOrNull('movie_id', widget.movieId),
    );

    if (existing.isNotEmpty) {
      await MovieHistoryTable().update(
        data: {
          'watched_duration': position.inSeconds,
          'total_duration': duration.inSeconds,
          'watched_at': supaSerialize<DateTime>(getCurrentTimestamp),
        },
        matchingRows: (rows) => rows.eq('id', existing.first.id),
      );
    } else {
      await MovieHistoryTable().insert({
        'user_id': currentUserUid,
        'movie_id': widget.movieId,
        'watched_duration': position.inSeconds,
        'total_duration': duration.inSeconds,
        'watched_at': supaSerialize<DateTime>(getCurrentTimestamp),
      });
    }
  }
}
