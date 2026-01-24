import '/components/interest_item/interest_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/header/header_widget.dart';
import '/main/navbar/navbar_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel1;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel2;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel3;
  // Model for InterestItem component.
  late InterestItemModel interestItemModel4;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    interestItemModel1 = createModel(context, () => InterestItemModel());
    interestItemModel2 = createModel(context, () => InterestItemModel());
    interestItemModel3 = createModel(context, () => InterestItemModel());
    interestItemModel4 = createModel(context, () => InterestItemModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    interestItemModel1.dispose();
    interestItemModel2.dispose();
    interestItemModel3.dispose();
    interestItemModel4.dispose();
    navbarModel.dispose();
  }
}
