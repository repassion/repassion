import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Username widget.
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Gib einen Namen ein.';
    }

    if (val.length < 3) {
      return 'Der Name muss min. 3 Zeichen lang sein.';
    }
    if (val.length > 25) {
      return 'Der Name darf max. 25 Zeichen lang sein.';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Dies ist keine gültige Eingabe.';
    }
    return null;
  }

  // State field(s) for Mail widget.
  TextEditingController? mailController;
  String? Function(BuildContext, String?)? mailControllerValidator;
  String? _mailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Gib eine E-Mail ein.';
    }

    if (val.length < 5) {
      return 'Die E-Mail muss min. 5 Zeichen lang sein.';
    }
    if (val.length > 40) {
      return 'Die E-Mail darf max. 25 Zeichen lang sein.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Dies ist keine gültige Eingabe.';
    }
    return null;
  }

  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Gib ein Passwort ein.';
    }

    if (val.length < 8) {
      return 'Das Passwort muss min. 8 Zeichen lang sein.';
    }
    if (val.length > 16) {
      return 'Das Passwort darf max. 16 Zeichen lang sein.';
    }

    return null;
  }

  // State field(s) for PasswordConfirm widget.
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  String? _passwordConfirmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Wiederhole das Passwort.';
    }

    if (val.length < 8) {
      return 'Das Passwort muss min. 8 Zeichen lang sein.';
    }
    if (val.length > 16) {
      return 'Das Passwort darf max. 16 Zeichen lang sein.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    usernameControllerValidator = _usernameControllerValidator;
    mailControllerValidator = _mailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmControllerValidator = _passwordConfirmControllerValidator;
  }

  void dispose() {
    usernameController?.dispose();
    mailController?.dispose();
    passwordController?.dispose();
    passwordConfirmController?.dispose();
  }

  /// Additional helper methods are added here.

}
