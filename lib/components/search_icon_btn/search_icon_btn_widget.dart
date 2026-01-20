import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_icon_btn_model.dart';
export 'search_icon_btn_model.dart';

class SearchIconBtnWidget extends StatefulWidget {
  const SearchIconBtnWidget({super.key});

  @override
  State<SearchIconBtnWidget> createState() => _SearchIconBtnWidgetState();
}

class _SearchIconBtnWidgetState extends State<SearchIconBtnWidget> {
  late SearchIconBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchIconBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      FFIcons.ksearchNormal01,
      color: FlutterFlowTheme.of(context).primaryText,
      size: 36.0,
    );
  }
}
