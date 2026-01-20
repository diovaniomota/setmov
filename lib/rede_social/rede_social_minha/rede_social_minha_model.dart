import '/flutter_flow/flutter_flow_util.dart';
import '/main/header/header_widget.dart';
import '/main/navbar/navbar_widget.dart';
import '/index.dart';
import 'rede_social_minha_widget.dart' show RedeSocialMinhaWidget;
import 'package:flutter/material.dart';

class RedeSocialMinhaModel extends FlutterFlowModel<RedeSocialMinhaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
  }
}
