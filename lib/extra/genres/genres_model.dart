import '/components/back_button/back_button_widget.dart';
import '/components/genre_item2/genre_item2_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'genres_widget.dart' show GenresWidget;
import 'package:flutter/material.dart';

class GenresModel extends FlutterFlowModel<GenresWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for SearchIconBtn component.
  late SearchIconBtnModel searchIconBtnModel;
  // Model for GenreItem2 component.
  late GenreItem2Model genreItem2Model1;
  // Model for GenreItem2 component.
  late GenreItem2Model genreItem2Model2;
  // Model for GenreItem2 component.
  late GenreItem2Model genreItem2Model3;
  // Model for GenreItem2 component.
  late GenreItem2Model genreItem2Model4;
  // Model for GenreItem2 component.
  late GenreItem2Model genreItem2Model5;
  // Model for GenreItem2 component.
  late GenreItem2Model genreItem2Model6;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    searchIconBtnModel = createModel(context, () => SearchIconBtnModel());
    genreItem2Model1 = createModel(context, () => GenreItem2Model());
    genreItem2Model2 = createModel(context, () => GenreItem2Model());
    genreItem2Model3 = createModel(context, () => GenreItem2Model());
    genreItem2Model4 = createModel(context, () => GenreItem2Model());
    genreItem2Model5 = createModel(context, () => GenreItem2Model());
    genreItem2Model6 = createModel(context, () => GenreItem2Model());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    searchIconBtnModel.dispose();
    genreItem2Model1.dispose();
    genreItem2Model2.dispose();
    genreItem2Model3.dispose();
    genreItem2Model4.dispose();
    genreItem2Model5.dispose();
    genreItem2Model6.dispose();
  }
}
