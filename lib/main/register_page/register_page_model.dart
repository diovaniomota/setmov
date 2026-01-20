import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TF_Nome widget.
  FocusNode? tFNomeFocusNode;
  TextEditingController? tFNomeTextController;
  String? Function(BuildContext, String?)? tFNomeTextControllerValidator;
  String? _tFNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for TF_Sobrenome widget.
  FocusNode? tFSobrenomeFocusNode;
  TextEditingController? tFSobrenomeTextController;
  String? Function(BuildContext, String?)? tFSobrenomeTextControllerValidator;
  String? _tFSobrenomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for TF_Telefone widget.
  FocusNode? tFTelefoneFocusNode;
  TextEditingController? tFTelefoneTextController;
  late MaskTextInputFormatter tFTelefoneMask;
  String? Function(BuildContext, String?)? tFTelefoneTextControllerValidator;
  String? _tFTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for TF_DataNascimento widget.
  FocusNode? tFDataNascimentoFocusNode;
  TextEditingController? tFDataNascimentoTextController;
  String? Function(BuildContext, String?)?
      tFDataNascimentoTextControllerValidator;
  String? _tFDataNascimentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  DateTime? datePicked;
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

  // State field(s) for TF_ConfirmarSenha widget.
  FocusNode? tFConfirmarSenhaFocusNode;
  TextEditingController? tFConfirmarSenhaTextController;
  late bool tFConfirmarSenhaVisibility;
  String? Function(BuildContext, String?)?
      tFConfirmarSenhaTextControllerValidator;
  String? _tFConfirmarSenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button_SignUp widget.
  bool? form;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button_SignUp widget.
  List<UsersRow>? supa;

  @override
  void initState(BuildContext context) {
    tFNomeTextControllerValidator = _tFNomeTextControllerValidator;
    tFSobrenomeTextControllerValidator = _tFSobrenomeTextControllerValidator;
    tFTelefoneTextControllerValidator = _tFTelefoneTextControllerValidator;
    tFDataNascimentoTextControllerValidator =
        _tFDataNascimentoTextControllerValidator;
    tFEmailTextControllerValidator = _tFEmailTextControllerValidator;
    tFSenhaVisibility = false;
    tFSenhaTextControllerValidator = _tFSenhaTextControllerValidator;
    tFConfirmarSenhaVisibility = false;
    tFConfirmarSenhaTextControllerValidator =
        _tFConfirmarSenhaTextControllerValidator;
  }

  @override
  void dispose() {
    tFNomeFocusNode?.dispose();
    tFNomeTextController?.dispose();

    tFSobrenomeFocusNode?.dispose();
    tFSobrenomeTextController?.dispose();

    tFTelefoneFocusNode?.dispose();
    tFTelefoneTextController?.dispose();

    tFDataNascimentoFocusNode?.dispose();
    tFDataNascimentoTextController?.dispose();

    tFEmailFocusNode?.dispose();
    tFEmailTextController?.dispose();

    tFSenhaFocusNode?.dispose();
    tFSenhaTextController?.dispose();

    tFConfirmarSenhaFocusNode?.dispose();
    tFConfirmarSenhaTextController?.dispose();
  }
}
