import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassionEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Titel widget.
  TextEditingController? titelController;
  String? Function(BuildContext, String?)? titelControllerValidator;
  String? _titelControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Beschreibung widget.
  TextEditingController? beschreibungController1;
  String? Function(BuildContext, String?)? beschreibungController1Validator;
  String? _beschreibungController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Beschreibung widget.
  TextEditingController? beschreibungController2;
  String? Function(BuildContext, String?)? beschreibungController2Validator;
  // State field(s) for Beschreibung widget.
  TextEditingController? beschreibungController3;
  String? Function(BuildContext, String?)? beschreibungController3Validator;
  String? _beschreibungController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titelControllerValidator = _titelControllerValidator;
    beschreibungController1Validator = _beschreibungController1Validator;
    beschreibungController3Validator = _beschreibungController3Validator;
  }

  void dispose() {
    titelController?.dispose();
    beschreibungController1?.dispose();
    beschreibungController2?.dispose();
    beschreibungController3?.dispose();
  }

  /// Additional helper methods are added here.

}
