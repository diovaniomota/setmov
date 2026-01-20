import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirmacao_de_alugar_filme_widget.dart'
    show ConfirmacaoDeAlugarFilmeWidget;
import 'package:flutter/material.dart';

class ConfirmacaoDeAlugarFilmeModel
    extends FlutterFlowModel<ConfirmacaoDeAlugarFilmeWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MovieRentalsRow>? returnMovieRentals;
  // Stores action output result for [Backend Call - API (subtrairvalor)] action in Button widget.
  ApiCallResponse? subtrairValor;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<MovieRentalsRow>? returnUpdRental;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MovieRentalsRow? returnInsertRental;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
