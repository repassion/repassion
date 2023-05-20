import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tag_loading_model.dart';
export 'tag_loading_model.dart';

class TagLoadingWidget extends StatefulWidget {
  const TagLoadingWidget({Key? key}) : super(key: key);

  @override
  _TagLoadingWidgetState createState() => _TagLoadingWidgetState();
}

class _TagLoadingWidgetState extends State<TagLoadingWidget> {
  late TagLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagLoadingModel());

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
      height: 50.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).primaryBackground,
            FlutterFlowTheme.of(context).secondaryBackground
          ],
          stops: [0.0, 0.5, 1.0],
          begin: AlignmentDirectional(1.0, -0.5),
          end: AlignmentDirectional(-1.0, 0.5),
        ),
      ),
    );
  }
}
