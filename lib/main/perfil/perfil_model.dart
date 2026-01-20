import '/backend/supabase/supabase.dart';
import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_atualizarFotosperfil2 = false;
  FFUploadedFile uploadedLocalFile_atualizarFotosperfil2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_atualizarFotosperfil2 = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in CircleImage widget.
  List<UsersRow>? perfil;
  bool isDataUploading_atualizarFotosperfil = false;
  FFUploadedFile uploadedLocalFile_atualizarFotosperfil =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_atualizarFotosperfil = '';

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
