import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TF_Email widget.
  FocusNode? tFEmailFocusNode;
  TextEditingController? tFEmailTextController;
  String? Function(BuildContext, String?)? tFEmailTextControllerValidator;
  String? _tFEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TF_Senha widget.
  FocusNode? tFSenhaFocusNode;
  TextEditingController? tFSenhaTextController;
  late bool tFSenhaVisibility;
  String? Function(BuildContext, String?)? tFSenhaTextControllerValidator;
  String? _tFSenhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    tFEmailTextControllerValidator = _tFEmailTextControllerValidator;
    tFSenhaVisibility = false;
    tFSenhaTextControllerValidator = _tFSenhaTextControllerValidator;
  }

  @override
  void dispose() {
    tFEmailFocusNode?.dispose();
    tFEmailTextController?.dispose();

    tFSenhaFocusNode?.dispose();
    tFSenhaTextController?.dispose();
  }
}
