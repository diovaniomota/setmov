import '/components/back_button/back_button_widget.dart';
import '/components/genre_item2/genre_item2_widget.dart';
import '/components/search_icon_btn/search_icon_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'genres_model.dart';
export 'genres_model.dart';

class GenresWidget extends StatefulWidget {
  const GenresWidget({super.key});

  static String routeName = 'Genres';
  static String routePath = '/genres';

  @override
  State<GenresWidget> createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
  late GenresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenresModel());

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
                    'Gêneros',
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
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                        model: _model.genreItem2Model1,
                        updateCallback: () => safeSetState(() {}),
                        child: GenreItem2Widget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/sonic-the-hedgehog-3_ncwdwcum_500x749.jpg?v=1725465425',
                          title: 'Ação',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.genreItem2Model2,
                        updateCallback: () => safeSetState(() {}),
                        child: GenreItem2Widget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/moana-2_4vhcigpq_500x749.jpg?v=1725481152',
                          title: 'Aventura',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.genreItem2Model3,
                        updateCallback: () => safeSetState(() {}),
                        child: GenreItem2Widget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/barbie_pztootty_5000b821-5de0-408c-9d7e-d728715e5c76_500x749.jpg?v=1715184383',
                          title: 'Comédia',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.genreItem2Model4,
                        updateCallback: () => safeSetState(() {}),
                        child: GenreItem2Widget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/longlegs_ver7_500x749.jpg?v=1717015553',
                          title: 'Drama',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.genreItem2Model5,
                        updateCallback: () => safeSetState(() {}),
                        child: GenreItem2Widget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/518881014ac2d0daf65131b96696ac45_e72836c5-7a5d-4b0a-afb3-c893aa26b193_500x749.jpg?v=1573615894',
                          title: 'Faroeste',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.genreItem2Model6,
                        updateCallback: () => safeSetState(() {}),
                        child: GenreItem2Widget(
                          poster:
                              'https://cdn.shopify.com/s/files/1/0057/3728/3618/files/wicked_50e86b10-21d9-469d-907d-fbd45bf3d8c3_500x749.jpg?v=1722004441',
                          title: 'Mistério',
                        ),
                      ),
                    ],
                  ),
                ].addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
