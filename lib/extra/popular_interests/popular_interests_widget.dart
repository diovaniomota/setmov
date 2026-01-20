import '/components/back_button/back_button_widget.dart';
import '/components/interest_item2/interest_item2_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/navbar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'popular_interests_model.dart';
export 'popular_interests_model.dart';

class PopularInterestsWidget extends StatefulWidget {
  const PopularInterestsWidget({super.key});

  static String routeName = 'PopularInterests';
  static String routePath = '/popularInterests';

  @override
  State<PopularInterestsWidget> createState() => _PopularInterestsWidgetState();
}

class _PopularInterestsWidgetState extends State<PopularInterestsWidget> {
  late PopularInterestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopularInterestsModel());

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
                    'Interesses Populares',
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Wrap(
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
                                model: _model.interestItem2Model1,
                                updateCallback: () => safeSetState(() {}),
                                child: InterestItem2Widget(
                                  poster:
                                      'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/avengersinfinitywar.styleb.reg.ar_500x749.jpg?v=1594305978',
                                  title: 'Super Heróis',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.interestItem2Model2,
                                updateCallback: () => safeSetState(() {}),
                                child: InterestItem2Widget(
                                  poster:
                                      'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/luca_uib9wgfd_500x749.jpg?v=1676653030',
                                  title: 'Animação',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.interestItem2Model3,
                                updateCallback: () => safeSetState(() {}),
                                child: InterestItem2Widget(
                                  poster:
                                      'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/lisa-frankenstein_h5reud5q_500x749.jpg?v=1707247438',
                                  title: 'Comédia Picante',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.interestItem2Model4,
                                updateCallback: () => safeSetState(() {}),
                                child: InterestItem2Widget(
                                  poster:
                                      'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/joker-folie-a-deux_wltjyy4w_500x749.jpg?v=1727465681',
                                  title: 'Curinga',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(height: 12.0))
                        .addToEnd(SizedBox(height: 12.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(),
                ),
              ),
            ].addToEnd(SizedBox(height: 0.0)),
          ),
        ),
      ),
    );
  }
}
