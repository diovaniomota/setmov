import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ratting_model.dart';
export 'ratting_model.dart';

class RattingWidget extends StatefulWidget {
  const RattingWidget({super.key});

  @override
  State<RattingWidget> createState() => _RattingWidgetState();
}

class _RattingWidgetState extends State<RattingWidget> {
  late RattingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RattingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.play_arrow,
          color: Color(0xFF8B5CF6),
          size: 16.0,
        ),
        Icon(
          Icons.play_arrow,
          color: Color(0xFF8B5CF6),
          size: 16.0,
        ),
        Icon(
          Icons.play_arrow,
          color: Color(0xFF8B5CF6),
          size: 16.0,
        ),
        Icon(
          Icons.play_arrow,
          color: Color(0xFF8B5CF6),
          size: 16.0,
        ),
      ].divide(SizedBox(width: 4.0)),
    );
  }
}
