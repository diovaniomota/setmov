import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/movies/confirmacao_de_alugar_filme/confirmacao_de_alugar_filme_widget.dart';
import 'package:flutter/material.dart';
import 'movie_accept_rental_model.dart';
export 'movie_accept_rental_model.dart';

/// Confirmação da locação do filme
class MovieAcceptRentalWidget extends StatefulWidget {
  const MovieAcceptRentalWidget({
    super.key,
    required this.movieId,
  });

  final int? movieId;

  static String routeName = 'Movie_AcceptRental';
  static String routePath = '/movieAcceptRental';

  @override
  State<MovieAcceptRentalWidget> createState() =>
      _MovieAcceptRentalWidgetState();
}

class _MovieAcceptRentalWidgetState extends State<MovieAcceptRentalWidget> {
  late MovieAcceptRentalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieAcceptRentalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: wrapWithModel(
              model: _model.confirmacaoDeAlugarFilmeModel,
              updateCallback: () => safeSetState(() {}),
              child: ConfirmacaoDeAlugarFilmeWidget(
                movieId: widget.movieId!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
