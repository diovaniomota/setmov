import '/components/back_button/back_button_widget.dart';
import '/components/interest_item2/interest_item2_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/navbar/navbar_widget.dart';
import 'popular_interests_widget.dart' show PopularInterestsWidget;
import 'package:flutter/material.dart';

class PopularInterestsModel extends FlutterFlowModel<PopularInterestsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for SearchIconBtn component.
  late SearchIconBtnModel searchIconBtnModel;
  // Model for InterestItem2 component.
  late InterestItem2Model interestItem2Model1;
  // Model for InterestItem2 component.
  late InterestItem2Model interestItem2Model2;
  // Model for InterestItem2 component.
  late InterestItem2Model interestItem2Model3;
  // Model for InterestItem2 component.
  late InterestItem2Model interestItem2Model4;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    searchIconBtnModel = createModel(context, () => SearchIconBtnModel());
    interestItem2Model1 = createModel(context, () => InterestItem2Model());
    interestItem2Model2 = createModel(context, () => InterestItem2Model());
    interestItem2Model3 = createModel(context, () => InterestItem2Model());
    interestItem2Model4 = createModel(context, () => InterestItem2Model());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    searchIconBtnModel.dispose();
    interestItem2Model1.dispose();
    interestItem2Model2.dispose();
    interestItem2Model3.dispose();
    interestItem2Model4.dispose();
    navbarModel.dispose();
  }
}
