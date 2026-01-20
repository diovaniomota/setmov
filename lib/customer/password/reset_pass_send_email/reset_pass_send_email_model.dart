import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_pass_send_email_widget.dart' show ResetPassSendEmailWidget;
import 'package:flutter/material.dart';

class ResetPassSendEmailModel
    extends FlutterFlowModel<ResetPassSendEmailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // State field(s) for TF_Email widget.
  FocusNode? tFEmailFocusNode;
  TextEditingController? tFEmailTextController;
  String? Function(BuildContext, String?)? tFEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    tFEmailFocusNode?.dispose();
    tFEmailTextController?.dispose();
  }
}
