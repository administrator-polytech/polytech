import '/components/app_bar_widget.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'about_us_page_widget.dart' show AboutUsPageWidget;
import 'package:flutter/material.dart';

class AboutUsPageModel extends FlutterFlowModel<AboutUsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for footer component.
  late FooterModel footerModel;
  // Model for appBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    footerModel.dispose();
    appBarModel.dispose();
  }
}
