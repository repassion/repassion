import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProfileSetup1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Vorname widget.
  TextEditingController? vornameController;
  String? Function(BuildContext, String?)? vornameControllerValidator;
  String? _vornameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Nachname widget.
  TextEditingController? nachnameController;
  String? Function(BuildContext, String?)? nachnameControllerValidator;
  String? _nachnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 15) {
      return 'Maximum 15 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vornameControllerValidator = _vornameControllerValidator;
    nachnameControllerValidator = _nachnameControllerValidator;
  }

  void dispose() {
    vornameController?.dispose();
    nachnameController?.dispose();
  }

  /// Additional helper methods are added here.

}
