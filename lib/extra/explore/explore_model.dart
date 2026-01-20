import '/flutter_flow/flutter_flow_util.dart';
import '/movies/movie_item2/movie_item2_widget.dart';
import '/index.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

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
