import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_PAGE_Chat_ON_INIT_STATE');
      if (!(await getPermissionStatus(notificationsPermission))) {
        logFirebaseEvent('Chat_request_permissions');
        await requestPermission(notificationsPermission);
      }
    });

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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CHAT_PAGE_Image_kdbo4qn4_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.goNamed(
                                    'Home',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
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
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CHAT_PAGE_Icon_8kj0wvqf_ON_TAP');
                                    logFirebaseEvent('Icon_navigate_to');

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
                                  child: Icon(
                                    Icons.library_books_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                          isEqualTo: currentUserReference),
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
                                  List<ChatRecord> containerChatRecordList =
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 25.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int requestsCount = snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 5.0, 5.0),
                                            child: badges.Badge(
                                              badgeContent: Text(
                                                functions
                                                    .notificationSum(
                                                        containerChatRecordList
                                                            .map((e) =>
                                                                e.notifications)
                                                            .toList(),
                                                        requestsCount)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              showBadge: functions
                                                      .notificationSum(
                                                          containerChatRecordList
                                                              .map((e) => e
                                                                  .notifications)
                                                              .toList(),
                                                          requestsCount)
                                                      .toString() !=
                                                  'null',
                                              shape: badges.BadgeShape.circle,
                                              badgeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              elevation: 1.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 5.0, 5.0, 5.0),
                                              position:
                                                  badges.BadgePosition.topEnd(),
                                              animationType: badges
                                                  .BadgeAnimationType.scale,
                                              toAnimate: true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CHAT_PAGE_Icon_hfw7aguu_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_navigate_to');

                                                    context.pushNamed(
                                                      'Home',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.chat_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CHAT_PAGE_Icon_uloyzajg_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed(
                                    'Settings',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.settings_outlined,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.85,
                                        decoration: BoxDecoration(),
                                        child: DefaultTabController(
                                          length: 2,
                                          initialIndex: 1,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment(0.0, 0),
                                                child: TabBar(
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  indicatorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  tabs: [
                                                    Tab(
                                                      text: 'Anfragen',
                                                    ),
                                                    Tab(
                                                      text: 'Chats',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  children: [
                                                    KeepAliveWidgetWrapper(
                                                      builder: (context) =>
                                                          StreamBuilder<
                                                              List<
                                                                  RequestRecord>>(
                                                        stream:
                                                            queryRequestRecord(
                                                          queryBuilder: (requestRecord) =>
                                                              requestRecord
                                                                  .where('uid2',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'pending'),
                                                        ),
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
                                                          List<RequestRecord>
                                                              columnRequestRecordList =
                                                              snapshot.data!;
                                                          if (columnRequestRecordList
                                                              .isEmpty) {
                                                            return NoEntriesWidget(
                                                              text:
                                                                  'Keine Anfragen.',
                                                            );
                                                          }
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  columnRequestRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnRequestRecord =
                                                                    columnRequestRecordList[
                                                                        columnIndex];
                                                                return Visibility(
                                                                  visible:
                                                                      columnRequestRecord
                                                                              .uid1 !=
                                                                          null,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        UserRecord>(
                                                                      stream: UserRecord.getDocument(
                                                                          columnRequestRecord
                                                                              .uid1!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final containerUserRecord =
                                                                            snapshot.data!;
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('CHAT_PAGE_Container_w93bd738_ON_TAP');
                                                                            logFirebaseEvent('Container_navigate_to');

                                                                            context.pushNamed(
                                                                              'UserWindow',
                                                                              params: {
                                                                                'user': serializeParam(
                                                                                  containerUserRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: valueOrDefault<String>(
                                                                                          containerUserRecord.photoUrl,
                                                                                          'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/proxy.jpg?alt=media&token=b05535d1-a08a-47b2-8b1c-c31429f82aa2',
                                                                                        ),
                                                                                        width: 80.0,
                                                                                        height: 100.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                containerUserRecord.firstName,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 16.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                child: Text(
                                                                                                  containerUserRecord.lastName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                '@${containerUserRecord.displayName}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('CHAT_PAGE_Icon_wwzw4gz4_ON_TAP');
                                                                                                logFirebaseEvent('Icon_haptic_feedback');
                                                                                                HapticFeedback.lightImpact();
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final requestUpdateData = createRequestRecordData(
                                                                                                  status: 'blocked',
                                                                                                );
                                                                                                await columnRequestRecord.reference.update(requestUpdateData);
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final userUpdateData1 = {
                                                                                                  'requests': FieldValue.arrayUnion([
                                                                                                    containerUserRecord.uid
                                                                                                  ]),
                                                                                                };
                                                                                                await currentUserReference!.update(userUpdateData1);
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final userUpdateData2 = {
                                                                                                  'requests': FieldValue.arrayUnion([currentUserUid]),
                                                                                                };
                                                                                                await containerUserRecord.reference.update(userUpdateData2);
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.close_sharp,
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                size: 50.0,
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('CHAT_PAGE_Icon_sj8p1e54_ON_TAP');
                                                                                                logFirebaseEvent('Icon_haptic_feedback');
                                                                                                HapticFeedback.lightImpact();
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final requestUpdateData = createRequestRecordData(
                                                                                                  status: 'accepted',
                                                                                                );
                                                                                                await columnRequestRecord.reference.update(requestUpdateData);
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final chatCreateData1 = {
                                                                                                  ...createChatRecordData(
                                                                                                    sender: columnRequestRecord.uid1,
                                                                                                    receiver: columnRequestRecord.uid2,
                                                                                                    lastActivity: '@${currentUserDisplayName} hat deine Anfrage akzeptiert.',
                                                                                                  ),
                                                                                                  'order_date': FieldValue.serverTimestamp(),
                                                                                                };
                                                                                                await ChatRecord.collection.doc().set(chatCreateData1);
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final chatCreateData2 = {
                                                                                                  ...createChatRecordData(
                                                                                                    sender: columnRequestRecord.uid2,
                                                                                                    receiver: columnRequestRecord.uid1,
                                                                                                    lastActivity: 'Du hast die Anfrage akzeptiert.',
                                                                                                  ),
                                                                                                  'order_date': FieldValue.serverTimestamp(),
                                                                                                };
                                                                                                await ChatRecord.collection.doc().set(chatCreateData2);
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.check_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 50.0,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation1']!);
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    KeepAliveWidgetWrapper(
                                                      builder: (context) =>
                                                          StreamBuilder<
                                                              List<ChatRecord>>(
                                                        stream: queryChatRecord(
                                                          queryBuilder: (chatRecord) =>
                                                              chatRecord
                                                                  .where(
                                                                      'sender',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .orderBy(
                                                                      'order_date',
                                                                      descending:
                                                                          true),
                                                        ),
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
                                                          List<ChatRecord>
                                                              columnChatRecordList =
                                                              snapshot.data!;
                                                          if (columnChatRecordList
                                                              .isEmpty) {
                                                            return NoEntriesWidget(
                                                              text:
                                                                  'Keine Chats.',
                                                            );
                                                          }
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  columnChatRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnChatRecord =
                                                                    columnChatRecordList[
                                                                        columnIndex];
                                                                return Visibility(
                                                                  visible:
                                                                      columnChatRecord
                                                                              .receiver !=
                                                                          null,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        UserRecord>(
                                                                      stream: UserRecord.getDocument(
                                                                          columnChatRecord
                                                                              .receiver!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final containerUserRecord =
                                                                            snapshot.data!;
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('CHAT_PAGE_Container_ekt9bti4_ON_TAP');
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            final chatUpdateData =
                                                                                createChatRecordData(
                                                                              notifications: 0,
                                                                            );
                                                                            await columnChatRecord.reference.update(chatUpdateData);
                                                                            logFirebaseEvent('Container_navigate_to');

                                                                            context.pushNamed(
                                                                              'ChatWindow',
                                                                              params: {
                                                                                'chat': serializeParam(
                                                                                  columnChatRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          onLongPress:
                                                                              () async {
                                                                            logFirebaseEvent('CHAT_Container_ekt9bti4_ON_LONG_PRESS');
                                                                            logFirebaseEvent('Container_navigate_to');

                                                                            context.pushNamed(
                                                                              'UserWindow',
                                                                              params: {
                                                                                'user': serializeParam(
                                                                                  containerUserRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl: valueOrDefault<String>(
                                                                                        containerUserRecord.photoUrl,
                                                                                        'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/proxy.jpg?alt=media&token=b05535d1-a08a-47b2-8b1c-c31429f82aa2',
                                                                                      ),
                                                                                      width: 80.0,
                                                                                      height: 100.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                        child: Text(
                                                                                                          containerUserRecord.firstName,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 16.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                        child: Text(
                                                                                                          containerUserRecord.lastName,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 16.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  columnChatRecord.lastActivity,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 14.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          StreamBuilder<List<ChatRecord>>(
                                                                                            stream: queryChatRecord(
                                                                                              queryBuilder: (chatRecord) => chatRecord.where('sender', isEqualTo: currentUserReference).where('receiver', isEqualTo: containerUserRecord.reference),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 25.0,
                                                                                                    height: 25.0,
                                                                                                    child: SpinKitRipple(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<ChatRecord> containerChatRecordList = snapshot.data!;
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                  child: badges.Badge(
                                                                                                    badgeContent: Text(
                                                                                                      functions.notificationSum(containerChatRecordList.map((e) => e.notifications).toList(), null).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: Colors.white,
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                    showBadge: functions.notificationSum(containerChatRecordList.map((e) => e.notifications).toList(), null).toString() != 'null',
                                                                                                    shape: badges.BadgeShape.circle,
                                                                                                    badgeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    elevation: 1.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                    position: badges.BadgePosition.topEnd(),
                                                                                                    animationType: badges.BadgeAnimationType.scale,
                                                                                                    toAnimate: true,
                                                                                                    child: Icon(
                                                                                                      Icons.chat_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation2']!);
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
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
