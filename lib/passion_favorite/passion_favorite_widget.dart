import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/current_passion_loading_widget.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'passion_favorite_model.dart';
export 'passion_favorite_model.dart';

class PassionFavoriteWidget extends StatefulWidget {
  const PassionFavoriteWidget({Key? key}) : super(key: key);

  @override
  _PassionFavoriteWidgetState createState() => _PassionFavoriteWidgetState();
}

class _PassionFavoriteWidgetState extends State<PassionFavoriteWidget>
    with TickerProviderStateMixin {
  late PassionFavoriteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
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
    _model = createModel(context, () => PassionFavoriteModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PassionFavorite'});

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
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PASSION_FAVORITE_Image_tnp2mmjl_ON_TAP');
                                        logFirebaseEvent('Image_navigate_to');

                                        context.pushNamed('Home');
                                      },
                                      child: Image.asset(
                                        'assets/images/icon_512_black_outlined.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.library_books_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 35.0,
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
                                                              'PASSION_FAVORITE_Icon_v8w0pr8n_ON_TAP');
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
                                            'PASSION_FAVORITE_Icon_u7w8v8lm_ON_TAP');
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
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 25.0, 25.0, 25.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Favoriten',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<PassionRecord>>(
                                              stream: queryPassionRecord(),
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
                                                List<PassionRecord>
                                                    passionsSearchPassionRecordList =
                                                    snapshot.data!;
                                                if (passionsSearchPassionRecordList
                                                    .isEmpty) {
                                                  return NoEntriesWidget(
                                                    text: 'Keine Favoriten.',
                                                  );
                                                }
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
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
                                                    return Visibility(
                                                      visible: (currentUserDocument
                                                                      ?.likes
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  passionsSearchPassionRecord
                                                                      .reference) ==
                                                          true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PASSION_FAVORITE_PAGE_Tag_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Tag_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'PassionWindow',
                                                                    params: {
                                                                      'passion':
                                                                          serializeParam(
                                                                        passionsSearchPassionRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.bottomToTop,
                                                                        duration:
                                                                            Duration(milliseconds: 250),
                                                                      ),
                                                                    },
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'Tag_backend_call');

                                                                  final userUpdateData =
                                                                      createUserRecordData(
                                                                    passion:
                                                                        passionsSearchPassionRecord
                                                                            .reference,
                                                                  );
                                                                  await currentUserReference!
                                                                      .update(
                                                                          userUpdateData);
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    CachedNetworkImage(
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        passionsSearchPassionRecord
                                                                            .image,
                                                                        'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/empty_article.jpg?alt=media&token=d8786d27-f588-4e24-8a60-2deb0358a439',
                                                                      ),
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'PASSION_FAVORITE_Icon_1igfqc06_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_backend_call');

                                                                        final userUpdateData =
                                                                            {
                                                                          'likes':
                                                                              FieldValue.arrayRemove([
                                                                            passionsSearchPassionRecord.reference
                                                                          ]),
                                                                        };
                                                                        await currentUserReference!
                                                                            .update(userUpdateData);
                                                                        logFirebaseEvent(
                                                                            'Icon_backend_call');

                                                                        final passionUpdateData =
                                                                            {
                                                                          'likes':
                                                                              FieldValue.increment(-(1)),
                                                                        };
                                                                        await passionsSearchPassionRecord
                                                                            .reference
                                                                            .update(passionUpdateData);
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation']!),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        ],
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
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).gradient1,
                            FlutterFlowTheme.of(context).primaryBackground
                          ],
                          stops: [0.0, 0.75],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (currentUserDocument!.passion != null)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 10.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<PassionRecord>(
                                    stream: PassionRecord.getDocument(
                                        currentUserDocument!.passion!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CurrentPassionLoadingWidget(),
                                        );
                                      }
                                      final currentPassionPassionRecord =
                                          snapshot.data!;
                                      return InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PASSION_FAVORITE_CurrentPassion_ON_TAP');
                                          logFirebaseEvent(
                                              'CurrentPassion_navigate_to');

                                          context.pushNamed(
                                            'PassionWindow',
                                            params: {
                                              'passion': serializeParam(
                                                currentPassionPassionRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                              ),
                                            },
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: CachedNetworkImage(
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        currentPassionPassionRecord
                                                            .image,
                                                        'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/empty_article.jpg?alt=media&token=d8786d27-f588-4e24-8a60-2deb0358a439',
                                                      ),
                                                      width: 75.0,
                                                      height: 75.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Wrap(
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
                                                          children: [
                                                            AutoSizeText(
                                                              currentPassionPassionRecord
                                                                  .title!,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Weiterlesen',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if ((currentUserDocument
                                                                  ?.likes
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(
                                                              currentPassionPassionRecord
                                                                  .reference) !=
                                                      true)
                                                    InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PASSION_FAVORITE_Icon_hneg9v17_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');

                                                        final userUpdateData = {
                                                          'likes': FieldValue
                                                              .arrayUnion([
                                                            currentPassionPassionRecord
                                                                .reference
                                                          ]),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                userUpdateData);
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');

                                                        final passionUpdateData =
                                                            {
                                                          'likes': FieldValue
                                                              .increment(1),
                                                        };
                                                        await currentPassionPassionRecord
                                                            .reference
                                                            .update(
                                                                passionUpdateData);
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .favorite_border_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                  if ((currentUserDocument
                                                                  ?.likes
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(
                                                              currentPassionPassionRecord
                                                                  .reference) ==
                                                      true)
                                                    InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PASSION_FAVORITE_Icon_9x1cjw8p_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');

                                                        final userUpdateData = {
                                                          'likes': FieldValue
                                                              .arrayRemove([
                                                            currentPassionPassionRecord
                                                                .reference
                                                          ]),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                userUpdateData);
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');

                                                        final passionUpdateData =
                                                            {
                                                          'likes': FieldValue
                                                              .increment(-(1)),
                                                        };
                                                        await currentPassionPassionRecord
                                                            .reference
                                                            .update(
                                                                passionUpdateData);
                                                      },
                                                      child: Icon(
                                                        Icons.favorite_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 25.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PASSION_FAVORITE_Container_tsm8988m_ON_T');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'PassionSearch',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Icon(
                                          Icons.search_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Icon(
                                        Icons.favorite_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 35.0,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PASSION_FAVORITE_Container_2m2tc7wx_ON_T');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'PassionOwn',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
