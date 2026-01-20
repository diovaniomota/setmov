import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_list_widget.dart' show MyListWidget;
import 'package:flutter/material.dart';

class MyListModel extends FlutterFlowModel<MyListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SearchIconBtn component.
  late SearchIconBtnModel searchIconBtnModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    searchIconBtnModel = createModel(context, () => SearchIconBtnModel());
  }

  @override
  void dispose() {
    searchIconBtnModel.dispose();
  }
}
