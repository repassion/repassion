import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatWindowModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Message widget.
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  String? _messageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Schreibe eine Nachricht.';
    }

    if (val.length < 1) {
      return 'Schreibe eine Nachricht.';
    }
    if (val.length > 500) {
      return 'Maximal 500 Zeichen erlaubt.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    messageControllerValidator = _messageControllerValidator;
  }

  void dispose() {
    columnController?.dispose();
    messageController?.dispose();
  }

  /// Additional helper methods are added here.

}
