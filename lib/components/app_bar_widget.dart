import '/backend/schema/enums/enums.dart';
import '/components/drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          elevation: 8.0,
          child: Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width >= 1100.0
                            ? 100.0
                            : 24.0,
                        0.0,
                      ),
                      0.0,
                      0.0,
                      0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'APP_BAR_COMP_Container_o59u0f05_ON_TAP');
                      if (MediaQuery.sizeOf(context).width >= 1100.0) {
                        logFirebaseEvent('Container_navigate_to');
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          HomePageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      } else {
                        logFirebaseEvent('Container_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: DrawerWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (MediaQuery.sizeOf(context).width < 1100.0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.menu_rounded,
                                color: Colors.white,
                                size: 36.0,
                              ),
                            ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.network(
                              'https://mejrlywlcqoftabytwfv.supabase.co/storage/v1/object/public/main/logoWithName.svg',
                              width: 204.0,
                              height: 52.1,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (MediaQuery.sizeOf(context).width >= 1100.0 ? true : false)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'APP_BAR_COMP_Container_t4hpt643_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              HomePageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: 160.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AnimatedDefaultTextStyle(
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.robotoMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'dcd8ayqn' /* HOME */,
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().applicationPageHover ==
                                    ApplicationPage.home)
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegion1Hovered1 = true);
                          logFirebaseEvent(
                              'APP_BAR_COMP_MouseRegion1_ON_TOGGLE_ON');
                          logFirebaseEvent('MouseRegion1_update_app_state');
                          FFAppState().applicationPageHover =
                              ApplicationPage.home;
                          safeSetState(() {});
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegion1Hovered1 = false);
                          logFirebaseEvent(
                              'APP_BAR_COMP_MouseRegion1_ON_TOGGLE_OFF');
                          logFirebaseEvent('MouseRegion1_update_app_state');
                          FFAppState().deleteApplicationPageHover();
                          FFAppState().applicationPageHover = null;

                          safeSetState(() {});
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'APP_BAR_COMP_Container_4th9rknw_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              AboutUsPageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: 160.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AnimatedDefaultTextStyle(
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.robotoMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lk7moeva' /* ABOUT US */,
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().applicationPageHover ==
                                    ApplicationPage.aboutUs)
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegion1Hovered2 = true);
                          logFirebaseEvent(
                              'APP_BAR_COMP_MouseRegion1_ON_TOGGLE_ON');
                          logFirebaseEvent('MouseRegion1_update_app_state');
                          FFAppState().applicationPageHover =
                              ApplicationPage.aboutUs;
                          safeSetState(() {});
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegion1Hovered2 = false);
                          logFirebaseEvent(
                              'APP_BAR_COMP_MouseRegion1_ON_TOGGLE_OFF');
                          logFirebaseEvent('MouseRegion1_update_app_state');
                          FFAppState().deleteApplicationPageHover();
                          FFAppState().applicationPageHover = null;

                          safeSetState(() {});
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'APP_BAR_COMP_Container_c0226lj4_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              ContactUsPageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: 160.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AnimatedDefaultTextStyle(
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.robotoMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'k3vofr9v' /* CONTACT US */,
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().applicationPageHover ==
                                    ApplicationPage.contactUs)
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegion1Hovered3 = true);
                          logFirebaseEvent(
                              'APP_BAR_COMP_MouseRegion1_ON_TOGGLE_ON');
                          logFirebaseEvent('MouseRegion1_update_app_state');
                          FFAppState().applicationPageHover =
                              ApplicationPage.contactUs;
                          safeSetState(() {});
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegion1Hovered3 = false);
                          logFirebaseEvent(
                              'APP_BAR_COMP_MouseRegion1_ON_TOGGLE_OFF');
                          logFirebaseEvent('MouseRegion1_update_app_state');
                          FFAppState().deleteApplicationPageHover();
                          FFAppState().applicationPageHover = null;

                          safeSetState(() {});
                        }),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                if (MediaQuery.sizeOf(context).width >= 1100.0 ? true : false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 100.0, 0.0),
                    child: MouseRegion(
                      opaque: false,
                      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'APP_BAR_COMP_Container_ls1v30e5_ON_TAP');
                          logFirebaseEvent('Container_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            ContactUsPageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Container(
                          width: 160.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(0xFFE5E5E5),
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AnimatedDefaultTextStyle(
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.albertSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5a43e6cs' /* Get In Touch */,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onEnter: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered = true);
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered = false);
                      }),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
