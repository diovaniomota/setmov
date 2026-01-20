import '/components/back_button/back_button_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/components/watch_history_item/watch_history_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'watch_history_model.dart';
export 'watch_history_model.dart';

class WatchHistoryWidget extends StatefulWidget {
  const WatchHistoryWidget({super.key});

  static String routeName = 'WatchHistory';
  static String routePath = '/watchHistory';

  @override
  State<WatchHistoryWidget> createState() => _WatchHistoryWidgetState();
}

class _WatchHistoryWidgetState extends State<WatchHistoryWidget> {
  late WatchHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchHistoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.backButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BackButtonWidget(),
                  ),
                  Text(
                    'Histórico de Alugados',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
              wrapWithModel(
                model: _model.searchIconBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: SearchIconBtnWidget(),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Wrap(
                    spacing: 0.0,
                    runSpacing: 20.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      wrapWithModel(
                        model: _model.watchHistoryItemModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/scan_2269aed4-cfa4-4787-93af-6cc03143c55d_500x749.jpg?v=1727895498',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/wild_robot_ver2_500x749.jpg?v=1718830597',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/a-minecraft-movie_rtwqhkoi_500x749.jpg?v=1727787393',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/lightyear_h4engnxh_500x749.jpg?v=1646409144',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/harold-and-the-purple-crayon_wyzkx0vl_500x749.jpg?v=1711030185',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel6,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/moana-2_h5f8f8rg_500x749.jpg?v=1728070136',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel7,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/snowwhite_ulw9lscz_500x749.jpg?v=1725481440',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.watchHistoryItemModel8,
                        updateCallback: () => safeSetState(() {}),
                        child: WatchHistoryItemWidget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/minions-the-rise-of-gru_bj1rmbf3_a6d1eca7-6953-4db9-82ab-f2770cd23e6f_500x749.jpg?v=1659550520',
                        ),
                      ),
                    ],
                  ),
                ]
                    .addToStart(SizedBox(height: 15.0))
                    .addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
