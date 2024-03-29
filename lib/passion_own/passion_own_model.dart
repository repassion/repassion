import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/current_passion_loading_widget.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassionOwnModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> users = [];
  void addToUsers(String item) => users.add(item);
  void removeFromUsers(String item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);

  bool? showAllTags;

  /// Query cache managers for this widget.

  final _passionOwnManager = StreamRequestManager<List<PassionRecord>>();
  Stream<List<PassionRecord>> passionOwn({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PassionRecord>> Function() requestFn,
  }) =>
      _passionOwnManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPassionOwnCache() => _passionOwnManager.clear();
  void clearPassionOwnCacheKey(String? uniqueKey) =>
      _passionOwnManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearPassionOwnCache();
  }

  /// Additional helper methods are added here.

}
