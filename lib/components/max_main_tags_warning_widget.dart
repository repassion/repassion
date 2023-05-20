import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'max_main_tags_warning_model.dart';
export 'max_main_tags_warning_model.dart';

class MaxMainTagsWarningWidget extends StatefulWidget {
  const MaxMainTagsWarningWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _MaxMainTagsWarningWidgetState createState() =>
      _MaxMainTagsWarningWidgetState();
}

class _MaxMainTagsWarningWidgetState extends State<MaxMainTagsWarningWidget> {
  late MaxMainTagsWarningModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaxMainTagsWarningModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
        child: Text(
          widget.text!,
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ),
    );
  }
}
