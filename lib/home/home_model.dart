import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> users = [];
  void addToUsers(String item) => users.add(item);
  void removeFromUsers(String item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);

  bool? showAllTags;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late SwipeableCardSectionController swipeableStackController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    swipeableStackController = SwipeableCardSectionController();
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
