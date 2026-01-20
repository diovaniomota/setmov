import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'terms_and_policy_widget.dart' show TermsAndPolicyWidget;
import 'package:flutter/material.dart';

class TermsAndPolicyModel extends FlutterFlowModel<TermsAndPolicyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
  }
}
