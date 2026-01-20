import '/components/genre_item/genre_item_widget.dart';
import '/components/interest_item/interest_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/header/header_widget.dart';
import '/main/navbar/navbar_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel1;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel2;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel3;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel4;
  // Model for GenreItem component.
  late GenreItemModel genreItemModel1;
  // Model for GenreItem component.
  late GenreItemModel genreItemModel2;
  // Model for GenreItem component.
  late GenreItemModel genreItemModel3;
  // Model for GenreItem component.
  late GenreItemModel genreItemModel4;
  // Model for GenreItem component.
  late GenreItemModel genreItemModel5;
  // Model for GenreItem component.
  late GenreItemModel genreItemModel6;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    interestItemModel1 = createModel(context, () => InterestItemModel());
    interestItemModel2 = createModel(context, () => InterestItemModel());
    interestItemModel3 = createModel(context, () => InterestItemModel());
    interestItemModel4 = createModel(context, () => InterestItemModel());
    genreItemModel1 = createModel(context, () => GenreItemModel());
    genreItemModel2 = createModel(context, () => GenreItemModel());
    genreItemModel3 = createModel(context, () => GenreItemModel());
    genreItemModel4 = createModel(context, () => GenreItemModel());
    genreItemModel5 = createModel(context, () => GenreItemModel());
    genreItemModel6 = createModel(context, () => GenreItemModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    interestItemModel1.dispose();
    interestItemModel2.dispose();
    interestItemModel3.dispose();
    interestItemModel4.dispose();
    genreItemModel1.dispose();
    genreItemModel2.dispose();
    genreItemModel3.dispose();
    genreItemModel4.dispose();
    genreItemModel5.dispose();
    genreItemModel6.dispose();
    navbarModel.dispose();
  }
}
