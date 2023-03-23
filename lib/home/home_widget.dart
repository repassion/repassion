import '/auth/auth_util.dart';
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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'swipeableStackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              constraints: BoxConstraints(
                maxWidth: 500.0,
                maxHeight: 1000.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 25.0, 25.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_512_green.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_Icon_hzhhby5b_ON_TAP');
                                          logFirebaseEvent('Icon_navigate_to');

                                          context.pushNamed(
                                            'PassionSearch',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.library_books_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<ChatRecord>>(
                                      stream: queryChatRecord(
                                        queryBuilder: (chatRecord) =>
                                            chatRecord.where('sender',
                                                isEqualTo:
                                                    currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 25.0,
                                              height: 25.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 25.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ChatRecord>
                                            containerChatRecordList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<int>(
                                            future: queryRequestRecordCount(
                                              queryBuilder: (requestRecord) =>
                                                  requestRecord
                                                      .where('uid2',
                                                          isEqualTo:
                                                              currentUserReference)
                                                      .where('status',
                                                          isEqualTo: 'pending'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child: SpinKitRipple(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              int requestsCount =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: badges.Badge(
                                                    badgeContent: Text(
                                                      functions
                                                          .notificationSum(
                                                              containerChatRecordList
                                                                  .map((e) => e
                                                                      .notifications)
                                                                  .withoutNulls
                                                                  .toList(),
                                                              requestsCount)
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                    ),
                                                    showBadge: functions
                                                            .notificationSum(
                                                                containerChatRecordList
                                                                    .map((e) =>
                                                                        e.notifications)
                                                                    .withoutNulls
                                                                    .toList(),
                                                                requestsCount)
                                                            .toString() !=
                                                        'null',
                                                    shape: badges
                                                        .BadgeShape.circle,
                                                    badgeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    elevation: 1.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    position: badges
                                                        .BadgePosition.topEnd(),
                                                    animationType: badges
                                                        .BadgeAnimationType
                                                        .scale,
                                                    toAnimate: true,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'HOME_PAGE_Icon_fjikmp29_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon_navigate_to');

                                                          context.pushNamed(
                                                            'Chat',
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .chat_bubble_outline_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 35.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Icon_qla792zg_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                          'Settings',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.settings_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 35.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<UserRecord>>(
                                  stream: queryUserRecord(
                                    queryBuilder: (userRecord) =>
                                        userRecord.whereNotIn(
                                            'uid',
                                            (currentUserDocument?.requests
                                                    ?.toList() ??
                                                [])),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 25.0,
                                          height: 25.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 25.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserRecord>
                                        swipeableStackUserRecordList =
                                        snapshot.data!;
                                    if (swipeableStackUserRecordList.isEmpty) {
                                      return NoEntriesWidget(
                                        text: 'Keine Personen gefunden.',
                                      );
                                    }
                                    return FlutterFlowSwipeableStack(
                                      topCardHeightFraction: 1.0,
                                      middleCardHeightFraction: 1.0,
                                      bottomCardHeightFraction: 1.0,
                                      topCardWidthFraction: 1.0,
                                      middleCardWidthFraction: 1.0,
                                      bottomCardWidthFraction: 1.0,
                                      onSwipeFn: (index) {},
                                      onLeftSwipe: (index) async {
                                        logFirebaseEvent(
                                            'HOME_SwipeableStack_zxq8il5j_ON_LEFT_SWI');
                                        logFirebaseEvent(
                                            'SwipeableStack_backend_call');

                                        final userUpdateData = {
                                          'requests': FieldValue.arrayUnion([
                                            swipeableStackUserRecordList[index]!
                                                .uid
                                          ]),
                                        };
                                        await currentUserReference!
                                            .update(userUpdateData);
                                      },
                                      onRightSwipe: (index) async {
                                        logFirebaseEvent(
                                            'HOME_SwipeableStack_zxq8il5j_ON_RIGHT_SW');
                                        logFirebaseEvent(
                                            'SwipeableStack_backend_call');

                                        final requestCreateData = {
                                          ...createRequestRecordData(
                                            uid1: currentUserReference,
                                            uid2: swipeableStackUserRecordList[
                                                    index]!
                                                .reference,
                                            status: 'pending',
                                          ),
                                          'datetime':
                                              FieldValue.serverTimestamp(),
                                        };
                                        await RequestRecord.collection
                                            .doc()
                                            .set(requestCreateData);
                                        logFirebaseEvent(
                                            'SwipeableStack_backend_call');

                                        final userUpdateData1 = {
                                          'requests': FieldValue.arrayUnion([
                                            swipeableStackUserRecordList[index]!
                                                .uid
                                          ]),
                                        };
                                        await currentUserReference!
                                            .update(userUpdateData1);
                                        if (swipeableStackUserRecordList[index]!
                                                .requests!
                                                .toList()
                                                .contains(currentUserUid) !=
                                            true) {
                                          logFirebaseEvent(
                                              'SwipeableStack_backend_call');

                                          final userUpdateData2 = {
                                            'requests': FieldValue.arrayUnion(
                                                [currentUserUid]),
                                          };
                                          await swipeableStackUserRecordList[
                                                  index]!
                                              .reference
                                              .update(userUpdateData2);
                                        }
                                        logFirebaseEvent(
                                            'SwipeableStack_trigger_push_notification');
                                        triggerPushNotification(
                                          notificationTitle: 'Kontaktanfrage',
                                          notificationText:
                                              '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')} hat dir eine Kontaktanfrage gesendet.',
                                          notificationImageUrl:
                                              currentUserPhoto,
                                          notificationSound: 'default',
                                          userRefs: [
                                            swipeableStackUserRecordList[index]!
                                                .reference
                                          ],
                                          initialPageName: 'Chat',
                                          parameterData: {},
                                        );
                                      },
                                      onUpSwipe: (index) {},
                                      onDownSwipe: (index) {},
                                      itemBuilder:
                                          (context, swipeableStackIndex) {
                                        final swipeableStackUserRecord =
                                            swipeableStackUserRecordList[
                                                swipeableStackIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 15.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 125.0,
                                                          height: 125.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      25.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      25.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                swipeableStackUserRecord
                                                                    .photoUrl,
                                                                'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/proxy.jpg?alt=media&token=b05535d1-a08a-47b2-8b1c-c31429f82aa2',
                                                              ),
                                                              width: 50.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Wrap(
                                                                    spacing:
                                                                        0.0,
                                                                    runSpacing:
                                                                        0.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      AutoSizeText(
                                                                        '${swipeableStackUserRecord.firstName} ${swipeableStackUserRecord.lastName} (${functions.getAge(swipeableStackUserRecord.birthdate).toString()})',
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                              fontSize: 20.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          '@${swipeableStackUserRecord.displayName}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                        if (swipeableStackUserRecord.verified ??
                                                                            true)
                                                                          Icon(
                                                                            Icons.verified,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (swipeableStackUserRecord
                                                                              .info !=
                                                                          null &&
                                                                      swipeableStackUserRecord
                                                                              .info !=
                                                                          '')
                                                                    Text(
                                                                      'Information',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Wrap(
                                                                      spacing:
                                                                          0.0,
                                                                      runSpacing:
                                                                          0.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Text(
                                                                          swipeableStackUserRecord
                                                                              .info!,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title3
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                                fontSize: 15.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (swipeableStackUserRecord
                                                                              .locationAddress !=
                                                                          null &&
                                                                      swipeableStackUserRecord
                                                                              .locationAddress !=
                                                                          '')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .getLocation(swipeableStackUserRecord.locationAddress),
                                                                          'Unbekannter Standort',
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<TagRecord>>(
                                                          stream:
                                                              queryTagRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 25.0,
                                                                  height: 25.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TagRecord>
                                                                wrapTagRecordList =
                                                                snapshot.data!;
                                                            return Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: List.generate(
                                                                  wrapTagRecordList
                                                                      .length,
                                                                  (wrapIndex) {
                                                                final wrapTagRecord =
                                                                    wrapTagRecordList[
                                                                        wrapIndex];
                                                                return Visibility(
                                                                  visible: swipeableStackUserRecord
                                                                          .mainTags!
                                                                          .toList()
                                                                          .contains(
                                                                              wrapTagRecord.reference) ==
                                                                      true,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          wrapTagRecord
                                                                              .text!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 12.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<TagRecord>>(
                                                        stream:
                                                            queryTagRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 25.0,
                                                                height: 25.0,
                                                                child:
                                                                    SpinKitRipple(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<TagRecord>
                                                              wrapTagRecordList =
                                                              snapshot.data!;
                                                          return Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: List.generate(
                                                                wrapTagRecordList
                                                                    .length,
                                                                (wrapIndex) {
                                                              final wrapTagRecord =
                                                                  wrapTagRecordList[
                                                                      wrapIndex];
                                                              return Visibility(
                                                                visible: (swipeableStackUserRecord
                                                                            .mainTags!
                                                                            .toList()
                                                                            .contains(wrapTagRecord
                                                                                .reference) ==
                                                                        false) &&
                                                                    (swipeableStackUserRecord
                                                                            .tags!
                                                                            .toList()
                                                                            .contains(wrapTagRecord.reference) ==
                                                                        true),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        wrapTagRecord
                                                                            .text!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              fontSize: 12.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (swipeableStackUserRecord
                                                                .about !=
                                                            null &&
                                                        swipeableStackUserRecord
                                                                .about !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Text(
                                                              'Über mich',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Wrap(
                                                                spacing: 0.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Text(
                                                                    swipeableStackUserRecord
                                                                        .about!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Text(
                                                            'Veröffentlichte Passions',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    PassionRecord>>(
                                                              stream:
                                                                  queryPassionRecord(
                                                                queryBuilder: (passionRecord) => passionRecord
                                                                    .where(
                                                                        'author',
                                                                        isEqualTo:
                                                                            swipeableStackUserRecord
                                                                                .reference)
                                                                    .where(
                                                                        'public',
                                                                        isEqualTo:
                                                                            true)
                                                                    .orderBy(
                                                                        'edited'),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          25.0,
                                                                      height:
                                                                          25.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PassionRecord>
                                                                    passionsSearchPassionRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                if (passionsSearchPassionRecordList
                                                                    .isEmpty) {
                                                                  return NoEntriesWidget(
                                                                    text:
                                                                        'Keine Passions veröffentlicht.',
                                                                  );
                                                                }
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: List.generate(
                                                                      passionsSearchPassionRecordList
                                                                          .length,
                                                                      (passionsSearchIndex) {
                                                                    final passionsSearchPassionRecord =
                                                                        passionsSearchPassionRecordList[
                                                                            passionsSearchIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_Tag_ON_TAP');
                                                                              logFirebaseEvent('Tag_navigate_to');

                                                                              context.pushNamed(
                                                                                'PassionWindow',
                                                                                params: {
                                                                                  'passion': serializeParam(
                                                                                    passionsSearchPassionRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.bottomToTop,
                                                                                    duration: Duration(milliseconds: 250),
                                                                                  ),
                                                                                },
                                                                              );

                                                                              logFirebaseEvent('Tag_backend_call');

                                                                              final userUpdateData = createUserRecordData(
                                                                                passion: passionsSearchPassionRecord.reference,
                                                                              );
                                                                              await currentUserReference!.update(userUpdateData);
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                CachedNetworkImage(
                                                                                  imageUrl: valueOrDefault<String>(
                                                                                    passionsSearchPassionRecord.image,
                                                                                    'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/empty_article.jpg?alt=media&token=d8786d27-f588-4e24-8a60-2deb0358a439',
                                                                                  ),
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            passionsSearchPassionRecord.title!,
                                                                                            textAlign: TextAlign.start,
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  fontSize: 15.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                          Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                child: Text(
                                                                                                  passionsSearchPassionRecord.description!,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if ((currentUserDocument?.likes?.toList() ?? []).contains(passionsSearchPassionRecord.reference) != true)
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_Icon_vnch59t5_ON_TAP');
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final userUpdateData = {
                                                                                        'likes': FieldValue.arrayUnion([
                                                                                          passionsSearchPassionRecord.reference
                                                                                        ]),
                                                                                      };
                                                                                      await currentUserReference!.update(userUpdateData);
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final passionUpdateData = {
                                                                                        'likes': FieldValue.increment(1),
                                                                                      };
                                                                                      await passionsSearchPassionRecord.reference.update(passionUpdateData);
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.favorite_border_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 25.0,
                                                                                    ),
                                                                                  ),
                                                                                if ((currentUserDocument?.likes?.toList() ?? []).contains(passionsSearchPassionRecord.reference) == true)
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_Icon_y7b1uqnm_ON_TAP');
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final userUpdateData = {
                                                                                        'likes': FieldValue.arrayRemove([
                                                                                          passionsSearchPassionRecord.reference
                                                                                        ]),
                                                                                      };
                                                                                      await currentUserReference!.update(userUpdateData);
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final passionUpdateData = {
                                                                                        'likes': FieldValue.increment(-(1)),
                                                                                      };
                                                                                      await passionsSearchPassionRecord.reference.update(passionUpdateData);
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.favorite_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 25.0,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation']!),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          swipeableStackUserRecordList.length,
                                      controller:
                                          _model.swipeableStackController,
                                      enableSwipeUp: false,
                                      enableSwipeDown: false,
                                    ).animateOnPageLoad(animationsMap[
                                        'swipeableStackOnPageLoadAnimation']!);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.125,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).gradient1,
                            FlutterFlowTheme.of(context).gradient2,
                            FlutterFlowTheme.of(context).primaryBackground
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 25.0, 25.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_Icon_jk9n88m1_ON_TAP');
                                    logFirebaseEvent('Icon_swipeable_stack');
                                    _model.swipeableStackController
                                        .triggerSwipeLeft();
                                  },
                                  onLongPress: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_Icon_jk9n88m1_ON_LONG_PRESS');
                                    logFirebaseEvent('Icon_haptic_feedback');
                                    HapticFeedback.mediumImpact();
                                    logFirebaseEvent('Icon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Später anzeigen'),
                                          content: Text(
                                              'Die Person wirkt interessant, doch nicht passen gerade? Kein Problem. Wir zeigen sie dir in Zukunft nochmal an.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Alles Klar!'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.close_sharp,
                                    color: Color(0xFFA23239),
                                    size: 50.0,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Icon_kfgzjbtc_ON_TAP');
                                logFirebaseEvent('Icon_swipeable_stack');
                                _model.swipeableStackController
                                    .triggerSwipeRight();
                              },
                              onLongPress: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Icon_kfgzjbtc_ON_LONG_PRESS');
                                logFirebaseEvent('Icon_haptic_feedback');
                                HapticFeedback.mediumImpact();
                                logFirebaseEvent('Icon_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Kontaktanfrage senden'),
                                      content: Text(
                                          'Die Person wirkt interessant? Sende eine Kontaktanfrage, um mit ihr zu schreiben.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Alles Klar!'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.check_sharp,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
