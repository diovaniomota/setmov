import '/backend/supabase/supabase.dart';
import '/components/back_button/back_button_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'rede_social_comments_widget.dart' show RedeSocialCommentsWidget;
import 'package:flutter/material.dart';

class RedeSocialCommentsModel
    extends FlutterFlowModel<RedeSocialCommentsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for SearchIconBtn component.
  late SearchIconBtnModel searchIconBtnModel;
  // State field(s) for TF_Comentario widget.
  FocusNode? tFComentarioFocusNode;
  TextEditingController? tFComentarioTextController;
  String? Function(BuildContext, String?)? tFComentarioTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  Completer<List<CommentWithUserRow>>? requestCompleter1;
  Completer<List<MovieCommentsRow>>? requestCompleter2;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    searchIconBtnModel = createModel(context, () => SearchIconBtnModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    searchIconBtnModel.dispose();
    tFComentarioFocusNode?.dispose();
    tFComentarioTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
