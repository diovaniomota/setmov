import '/components/back_button/back_button_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/movies/movie_item2/movie_item2_widget.dart';
import '/index.dart';
import 'single_category_widget.dart' show SingleCategoryWidget;
import 'package:flutter/material.dart';

class SingleCategoryModel extends FlutterFlowModel<SingleCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for SearchIconBtn component.
  late SearchIconBtnModel searchIconBtnModel;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model1;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model2;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model3;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model4;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model5;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model6;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model7;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model8;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model9;
  // Model for MovieItem2 component.
  late MovieItem2Model movieItem2Model10;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    searchIconBtnModel = createModel(context, () => SearchIconBtnModel());
    movieItem2Model1 = createModel(context, () => MovieItem2Model());
    movieItem2Model2 = createModel(context, () => MovieItem2Model());
    movieItem2Model3 = createModel(context, () => MovieItem2Model());
    movieItem2Model4 = createModel(context, () => MovieItem2Model());
    movieItem2Model5 = createModel(context, () => MovieItem2Model());
    movieItem2Model6 = createModel(context, () => MovieItem2Model());
    movieItem2Model7 = createModel(context, () => MovieItem2Model());
    movieItem2Model8 = createModel(context, () => MovieItem2Model());
    movieItem2Model9 = createModel(context, () => MovieItem2Model());
    movieItem2Model10 = createModel(context, () => MovieItem2Model());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    searchIconBtnModel.dispose();
    movieItem2Model1.dispose();
    movieItem2Model2.dispose();
    movieItem2Model3.dispose();
    movieItem2Model4.dispose();
    movieItem2Model5.dispose();
    movieItem2Model6.dispose();
    movieItem2Model7.dispose();
    movieItem2Model8.dispose();
    movieItem2Model9.dispose();
    movieItem2Model10.dispose();
  }
}
