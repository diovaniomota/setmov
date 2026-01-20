import '/components/trailer_player/trailer_player_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'trailer_details_model.dart';
export 'trailer_details_model.dart';

class TrailerDetailsWidget extends StatefulWidget {
  const TrailerDetailsWidget({
    super.key,
    required this.img,
  });

  final String? img;

  @override
  State<TrailerDetailsWidget> createState() => _TrailerDetailsWidgetState();
}

class _TrailerDetailsWidgetState extends State<TrailerDetailsWidget> {
  late TrailerDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrailerDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      height: 122.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              widget.img!,
              width: 175.0,
              height: 122.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x62191A1F),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: WebViewAware(
                          child: TrailerPlayerWidget(),
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  FFIcons.kplayCircle02,
                  color: FlutterFlowTheme.of(context).info,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
