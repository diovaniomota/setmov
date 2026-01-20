import '/components/back_button/back_button_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/components/watch_history_item/watch_history_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'watch_history_widget.dart' show WatchHistoryWidget;
import 'package:flutter/material.dart';

class WatchHistoryModel extends FlutterFlowModel<WatchHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for SearchIconBtn component.
  late SearchIconBtnModel searchIconBtnModel;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel1;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel2;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel3;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel4;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel5;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel6;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel7;
  // Model for WatchHistoryItem component.
  late WatchHistoryItemModel watchHistoryItemModel8;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    searchIconBtnModel = createModel(context, () => SearchIconBtnModel());
    watchHistoryItemModel1 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel2 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel3 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel4 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel5 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel6 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel7 =
        createModel(context, () => WatchHistoryItemModel());
    watchHistoryItemModel8 =
        createModel(context, () => WatchHistoryItemModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    searchIconBtnModel.dispose();
    watchHistoryItemModel1.dispose();
    watchHistoryItemModel2.dispose();
    watchHistoryItemModel3.dispose();
    watchHistoryItemModel4.dispose();
    watchHistoryItemModel5.dispose();
    watchHistoryItemModel6.dispose();
    watchHistoryItemModel7.dispose();
    watchHistoryItemModel8.dispose();
  }
}
