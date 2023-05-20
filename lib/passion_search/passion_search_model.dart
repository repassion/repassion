import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/current_passion_loading_widget.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassionSearchModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> users = [];
  void addToUsers(String item) => users.add(item);
  void removeFromUsers(String item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);

  bool? showAllTags;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  Completer<List<PassionRecord>>? algoliaRequestCompleter2;
  Completer<List<CategoryRecord>>? algoliaRequestCompleter1;

  /// Query cache managers for this widget.

  final _passionCategoriesManager =
      StreamRequestManager<List<CategoryRecord>>();
  Stream<List<CategoryRecord>> passionCategories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoryRecord>> Function() requestFn,
  }) =>
      _passionCategoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPassionCategoriesCache() => _passionCategoriesManager.clear();
  void clearPassionCategoriesCacheKey(String? uniqueKey) =>
      _passionCategoriesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchFieldController?.dispose();

    /// Dispose query cache managers for this widget.

    clearPassionCategoriesCache();
  }

  /// Additional helper methods are added here.

  Future waitForAlgoliaRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForAlgoliaRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
