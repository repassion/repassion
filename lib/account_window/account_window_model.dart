import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountWindowModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Username widget.
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Der Nutzername wird benötigt';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for E-Mail widget.
  TextEditingController? eMailController;
  String? Function(BuildContext, String?)? eMailControllerValidator;
  String? _eMailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 40) {
      return 'Maximum 40 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    usernameControllerValidator = _usernameControllerValidator;
    eMailControllerValidator = _eMailControllerValidator;
  }

  void dispose() {
    usernameController?.dispose();
    eMailController?.dispose();
  }

  /// Additional helper methods are added here.

}
