import '/flutter_flow/flutter_flow_util.dart';
import '/movies/confirmacao_de_alugar_filme/confirmacao_de_alugar_filme_widget.dart';
import 'movie_accept_rental_widget.dart' show MovieAcceptRentalWidget;
import 'package:flutter/material.dart';

class MovieAcceptRentalModel extends FlutterFlowModel<MovieAcceptRentalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for confirmacaoDeAlugarFilme component.
  late ConfirmacaoDeAlugarFilmeModel confirmacaoDeAlugarFilmeModel;

  @override
  void initState(BuildContext context) {
    confirmacaoDeAlugarFilmeModel =
        createModel(context, () => ConfirmacaoDeAlugarFilmeModel());
  }

  @override
  void dispose() {
    confirmacaoDeAlugarFilmeModel.dispose();
  }
}
