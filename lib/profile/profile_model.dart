import '/components/recent_movie_item/recent_movie_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RecentMovieItem component.
  late RecentMovieItemModel recentMovieItemModel1;
  // Model for RecentMovieItem component.
  late RecentMovieItemModel recentMovieItemModel2;
  // Model for RecentMovieItem component.
  late RecentMovieItemModel recentMovieItemModel3;

  @override
  void initState(BuildContext context) {
    recentMovieItemModel1 = createModel(context, () => RecentMovieItemModel());
    recentMovieItemModel2 = createModel(context, () => RecentMovieItemModel());
    recentMovieItemModel3 = createModel(context, () => RecentMovieItemModel());
  }

  @override
  void dispose() {
    recentMovieItemModel1.dispose();
    recentMovieItemModel2.dispose();
    recentMovieItemModel3.dispose();
  }
}
