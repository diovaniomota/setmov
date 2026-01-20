import '/components/episode_item/episode_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/navbar/navbar_widget.dart';
import '/index.dart';
import 'serie_details_widget.dart' show SerieDetailsWidget;
import 'package:flutter/material.dart';

class SerieDetailsModel extends FlutterFlowModel<SerieDetailsWidget> {
  ///  Local state fields for this page.

  bool added = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for EpisodeItem component.
  late EpisodeItemModel episodeItemModel;
  // Model for Navbar component.
  late NavbarModel navbarModel1;
  // Model for Navbar component.
  late NavbarModel navbarModel2;

  @override
  void initState(BuildContext context) {
    episodeItemModel = createModel(context, () => EpisodeItemModel());
    navbarModel1 = createModel(context, () => NavbarModel());
    navbarModel2 = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    episodeItemModel.dispose();
    navbarModel1.dispose();
    navbarModel2.dispose();
  }
}
