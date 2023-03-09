import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_media.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileWindowModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Vorname widget.
  TextEditingController? vornameController;
  String? Function(BuildContext, String?)? vornameControllerValidator;
  String? _vornameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Der Vorname wird bemötigt';
    }

    if (val.length < 2) {
      return 'Der Vorname ist zu kurz';
    }
    if (val.length > 10) {
      return 'Der Vorname ist zu lang';
    }

    return null;
  }

  // State field(s) for Nachname widget.
  TextEditingController? nachnameController;
  String? Function(BuildContext, String?)? nachnameControllerValidator;
  String? _nachnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Der Nachname wird benötigt';
    }

    if (val.length < 2) {
      return 'Der Nachname ist zu kurz';
    }
    if (val.length > 15) {
      return 'Der Nachname ist zu lang';
    }

    return null;
  }

  // State field(s) for Geburtstag widget.
  TextEditingController? geburtstagController;
  final geburtstagMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? geburtstagControllerValidator;
  String? _geburtstagControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Der Geburtstag wird benötigt';
    }

    return null;
  }

  // State field(s) for Information widget.
  TextEditingController? informationController;
  String? Function(BuildContext, String?)? informationControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Standort widget.
  var standortValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vornameControllerValidator = _vornameControllerValidator;
    nachnameControllerValidator = _nachnameControllerValidator;
    geburtstagControllerValidator = _geburtstagControllerValidator;
  }

  void dispose() {
    vornameController?.dispose();
    nachnameController?.dispose();
    geburtstagController?.dispose();
    informationController?.dispose();
  }

  /// Additional helper methods are added here.

}
