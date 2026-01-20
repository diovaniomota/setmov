import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/navbar/navbar_widget.dart';
import '/index.dart';
import 'dart:async';
import 'rede_social_profile_widget.dart' show RedeSocialProfileWidget;
import 'package:flutter/material.dart';

class RedeSocialProfileModel extends FlutterFlowModel<RedeSocialProfileWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<UserFollowsRow>>? requestCompleter;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
