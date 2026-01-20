import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'movie_trailer_play_widget.dart' show MovieTrailerPlayWidget;
import 'package:flutter/material.dart';

class MovieTrailerPlayModel extends FlutterFlowModel<MovieTrailerPlayWidget> {
  ///  Local state fields for this page.

  bool added = false;

  bool favorited = false;

  MovieRentalsRow? movieRental;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
