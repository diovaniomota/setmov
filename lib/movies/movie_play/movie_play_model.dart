import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'movie_play_widget.dart' show MoviePlayWidget;
import 'package:flutter/material.dart';

class MoviePlayModel extends FlutterFlowModel<MoviePlayWidget> {
  ///  Local state fields for this page.

  bool added = false;

  bool favorited = false;

  MovieRentalsRow? movieRental;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Movie_Play widget.
  List<MovieFavoritesRow>? returnUserFavMovies;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<MovieRentalsRow>? returnUpdRental;
  // Stores action output result for [Backend Call - API (subtrairvalor)] action in Button widget.
  ApiCallResponse? valor;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  MovieFavoritesRow? returnFavorite;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
