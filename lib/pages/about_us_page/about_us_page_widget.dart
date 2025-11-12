import '/components/app_bar_widget.dart';
import '/components/contact_us_dialog_widget.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_page_model.dart';
export 'about_us_page_model.dart';

/// UAE-based app development experts serving Dubai, Abu Dhabi, and all seven
/// Emirates.
///
/// Discover our team, process, and commitment to delivering quality software.
class AboutUsPageWidget extends StatefulWidget {
  const AboutUsPageWidget({super.key});

  static String routeName = 'aboutUsPage';
  static String routePath = '/aboutUsPage';

  @override
  State<AboutUsPageWidget> createState() => _AboutUsPageWidgetState();
}

class _AboutUsPageWidgetState extends State<AboutUsPageWidget> {
  late AboutUsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'aboutUsPage'});
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        floatingActionButton: Align(
          alignment: AlignmentDirectional(1.0, 1.0),
          child: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () async {
                logFirebaseEvent('ABOUT_US_FloatingActionButton_1dxcujdf_O');
                logFirebaseEvent('FloatingActionButton_alert_dialog');
                await showAlignedDialog(
                  context: context,
                  isGlobal: false,
                  avoidOverflow: true,
                  targetAnchor: AlignmentDirectional(1.0, 1.0)
                      .resolve(Directionality.of(context)),
                  followerAnchor: AlignmentDirectional(1.0, 1.0)
                      .resolve(Directionality.of(context)),
                  builder: (dialogContext) {
                    return Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(dialogContext).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Container(
                          height: 205.0,
                          width: 275.0,
                          child: ContactUsDialogWidget(),
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: Colors.black,
              elevation: 8.0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF7300FF), Colors.black],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-0.64, -1.0),
                    end: AlignmentDirectional(0.64, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: Icon(
                  Icons.support_agent_rounded,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: MediaQuery.sizeOf(context).width >= 1100.0 ? true : false,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: wrapWithModel(
                  model: _model.appBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppBarWidget(),
                ),
              ),
              centerTitle: true,
              toolbarHeight: 120.0,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    child: Divider(
                                      thickness: 2.0,
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0,
                                          0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ymbrqrwt' /* WHAT WE DO */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.robotoMono(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF131313),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width * 0.05,
                                        0.0,
                                      ),
                                      24.0,
                                      0.0,
                                      0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '10cgzock' /* ABOUT POLY TECH */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          font: GoogleFonts.robotoMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .displayLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .displayLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF131313),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .displayLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .displayLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Flex(
                                direction:
                                    (MediaQuery.sizeOf(context).width >= 1100.0
                                            ? true
                                            : false)
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width >=
                                                    1100.0
                                                ? (MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.0)
                                                : (MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.05),
                                            0.0,
                                          ),
                                          0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl:
                                              'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/aboutUsMain.png',
                                          width: 558.0,
                                          height: 584.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Flex(
                                      direction: Axis.vertical,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 0),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 0),
                                              imageUrl:
                                                  'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/aboutUsObject.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  48.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 600.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8lho59ed' /* At POLY TECH, we are full-stac... */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displayLarge
                                                    .override(
                                                      font: GoogleFonts.rubik(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayLarge
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF141414),
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displayLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width * 0.05,
                                      0.0,
                                    ),
                                    336.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width * 0.05,
                                      0.0,
                                    ),
                                    0.0),
                                child: ClipRRect(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Transform(
                                            transform: Matrix4.skew(-2.1, 0.0),
                                            origin: Offset(0.0, 4.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.15,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE5E5E5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE5E5E5),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '4z26euzp' /* /WHAT WE DO */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.robotoMono(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF141414),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Flex(
                                          direction: (MediaQuery.sizeOf(context)
                                                          .width >=
                                                      1100.0
                                                  ? true
                                                  : false)
                                              ? Axis.horizontal
                                              : Axis.vertical,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6paaknza' /* OUR EXPERTISE */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .robotoMono(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF131313),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 400.0,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u0638il1' /* Building powerful digital solu... */,
                                                  ),
                                                  maxLines: 10,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .robotoMono(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF131313),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide((MediaQuery.sizeOf(context)
                                                          .width >=
                                                      1100.0
                                                  ? true
                                                  : false)
                                              ? SizedBox(
                                                  width: (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width >=
                                                              1100.0
                                                          ? 72
                                                          : 24)
                                                      .toDouble())
                                              : SizedBox(
                                                  height: (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width >=
                                                              1100.0
                                                          ? 72
                                                          : 24)
                                                      .toDouble())),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Flex(
                                direction:
                                    (MediaQuery.sizeOf(context).width >= 1100.0
                                            ? true
                                            : false)
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0,
                                          0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl:
                                              'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/aboutUsSub1.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                            0.0,
                                          ),
                                          0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl:
                                              'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/aboutUsSub2.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide((MediaQuery.sizeOf(context).width >=
                                            1100.0
                                        ? true
                                        : false)
                                    ? SizedBox(
                                        width:
                                            (MediaQuery.sizeOf(context).width >=
                                                        1100.0
                                                    ? 72
                                                    : 24)
                                                .toDouble())
                                    : SizedBox(
                                        height:
                                            (MediaQuery.sizeOf(context).width >=
                                                        1100.0
                                                    ? 72
                                                    : 24)
                                                .toDouble())),
                              ),
                              Flex(
                                direction:
                                    (MediaQuery.sizeOf(context).width >= 1100.0
                                            ? true
                                            : false)
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0,
                                          0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl:
                                              'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/aboutUsSub3.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                            0.0,
                                          ),
                                          0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl:
                                              'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/aboutUsSub4.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide((MediaQuery.sizeOf(context).width >=
                                            1100.0
                                        ? true
                                        : false)
                                    ? SizedBox(
                                        width:
                                            (MediaQuery.sizeOf(context).width >=
                                                        1100.0
                                                    ? 72
                                                    : 24)
                                                .toDouble())
                                    : SizedBox(
                                        height:
                                            (MediaQuery.sizeOf(context).width >=
                                                        1100.0
                                                    ? 72
                                                    : 24)
                                                .toDouble())),
                              ),
                            ]
                                .divide(SizedBox(height: 24.0))
                                .addToStart(SizedBox(height: 72.0))
                                .addToEnd(SizedBox(height: 72.0)),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.footerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FooterWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
