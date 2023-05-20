import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/current_passion_loading_widget.dart';
import '/components/no_entries_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'passion_search_model.dart';
export 'passion_search_model.dart';

class PassionSearchWidget extends StatefulWidget {
  const PassionSearchWidget({Key? key}) : super(key: key);

  @override
  _PassionSearchWidgetState createState() => _PassionSearchWidgetState();
}

class _PassionSearchWidgetState extends State<PassionSearchWidget>
    with TickerProviderStateMixin {
  late PassionSearchModel _model;

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
          begin: Offset(-10.0, 0.0),
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
          begin: Offset(-10.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PassionSearchModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PassionSearch'});
    _model.searchFieldController ??= TextEditingController();

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
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PASSION_SEARCH_Image_qt4bja2m_ON_TAP');
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
                                            .primary,
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
                                                                  .toList(),
                                                              requestsCount)
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
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
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    showBadge: functions
                                                            .notificationSum(
                                                                containerChatRecordList
                                                                    .map((e) =>
                                                                        e.notifications)
                                                                    .toList(),
                                                                requestsCount)
                                                            .toString() !=
                                                        'null',
                                                    shape: badges
                                                        .BadgeShape.circle,
                                                    badgeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
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
                                                              'PASSION_SEARCH_PAGE_Icon_csc9t2cx_ON_TAP');
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
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PASSION_SEARCH_PAGE_Icon_wcagfi0v_ON_TAP');
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: TextFormField(
                                      controller: _model.searchFieldController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.searchFieldController',
                                        Duration(milliseconds: 500),
                                        () async {
                                          logFirebaseEvent(
                                              'PASSION_SEARCH_SearchField_ON_TEXTFIELD_');
                                          logFirebaseEvent(
                                              'SearchField_refresh_database_request');
                                          setState(() => _model
                                              .algoliaRequestCompleter2 = null);
                                          await _model
                                              .waitForAlgoliaRequestCompleted2();
                                          logFirebaseEvent(
                                              'SearchField_refresh_database_request');
                                          setState(() => _model
                                              .algoliaRequestCompleter1 = null);
                                          await _model
                                              .waitForAlgoliaRequestCompleted1();
                                        },
                                      ),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Suche',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        hintText: 'Passions durchsuchen',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDA2C38),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDA2C38),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        suffixIcon: _model
                                                .searchFieldController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.searchFieldController
                                                      ?.clear();
                                                  logFirebaseEvent(
                                                      'PASSION_SEARCH_SearchField_ON_TEXTFIELD_');
                                                  logFirebaseEvent(
                                                      'SearchField_refresh_database_request');
                                                  setState(() => _model
                                                          .algoliaRequestCompleter2 =
                                                      null);
                                                  await _model
                                                      .waitForAlgoliaRequestCompleted2();
                                                  logFirebaseEvent(
                                                      'SearchField_refresh_database_request');
                                                  setState(() => _model
                                                          .algoliaRequestCompleter1 =
                                                      null);
                                                  await _model
                                                      .waitForAlgoliaRequestCompleted1();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .searchFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (_model.searchFieldController
                                                      .text !=
                                                  null &&
                                              _model.searchFieldController
                                                      .text !=
                                                  '')
                                            FutureBuilder<List<PassionRecord>>(
                                              future: (_model
                                                          .algoliaRequestCompleter2 ??=
                                                      Completer<
                                                          List<PassionRecord>>()
                                                        ..complete(PassionRecord
                                                            .search(
                                                          term: _model
                                                              .searchFieldController
                                                              .text,
                                                          maxResults: 10,
                                                          useCache: true,
                                                        )))
                                                  .future,
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
                                                    text:
                                                        'Keine Suchergebnisse.',
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
                                                      visible: valueOrDefault<
                                                              bool>(
                                                            passionsSearchPassionRecord
                                                                .public,
                                                            false,
                                                          ) ||
                                                          (passionsSearchPassionRecord
                                                                  .author ==
                                                              currentUserReference),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: ClipRRect(
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
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PASSION_SEARCH_PAGE_Tag_ON_TAP');
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
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              250),
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
                                                                    width: 50.0,
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
                                                                              passionsSearchPassionRecord.title,
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 15.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                    passionsSearchPassionRecord.description,
                                                                                    textAlign: TextAlign.start,
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                  if ((currentUserDocument?.likes?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              passionsSearchPassionRecord.reference) !=
                                                                      true)
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
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
                                                                          logFirebaseEvent(
                                                                              'PASSION_SEARCH_PAGE_Icon_afwila3m_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_backend_call');

                                                                          final userUpdateData =
                                                                              {
                                                                            'likes':
                                                                                FieldValue.arrayUnion([
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
                                                                                FieldValue.increment(1),
                                                                          };
                                                                          await passionsSearchPassionRecord
                                                                              .reference
                                                                              .update(passionUpdateData);
                                                                          logFirebaseEvent(
                                                                              'Icon_refresh_database_request');
                                                                          setState(() =>
                                                                              _model.algoliaRequestCompleter2 = null);
                                                                          await _model
                                                                              .waitForAlgoliaRequestCompleted2();
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_border_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if ((currentUserDocument?.likes?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              passionsSearchPassionRecord.reference) ==
                                                                      true)
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
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
                                                                          logFirebaseEvent(
                                                                              'PASSION_SEARCH_PAGE_Icon_nly4inlz_ON_TAP');
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
                                                                          logFirebaseEvent(
                                                                              'Icon_refresh_database_request');
                                                                          setState(() =>
                                                                              _model.algoliaRequestCompleter2 = null);
                                                                          await _model
                                                                              .waitForAlgoliaRequestCompleted2();
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation1']!),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          Text(
                                            'Kategorien',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
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
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          if (_model.searchFieldController
                                                      .text ==
                                                  null ||
                                              _model.searchFieldController
                                                      .text ==
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    StreamBuilder<
                                                        List<CategoryRecord>>(
                                                  stream:
                                                      _model.passionCategories(
                                                    uniqueQueryKey:
                                                        'passion_categories:${currentUserUid}',
                                                    overrideCache: (currentUserDocument
                                                                    ?.cacheOverride
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                'passion_categories') ||
                                                        FFAppState()
                                                            .cacheOverride
                                                            .contains(
                                                                'passion_categories'),
                                                    requestFn: () =>
                                                        queryCategoryRecord(),
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
                                                    List<CategoryRecord>
                                                        categoriesCategoryRecordList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: List.generate(
                                                          categoriesCategoryRecordList
                                                              .length,
                                                          (categoriesIndex) {
                                                        final categoriesCategoryRecord =
                                                            categoriesCategoryRecordList[
                                                                categoriesIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PASSION_SEARCH_PAGE_Tag_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Tag_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'CategoryWindow',
                                                                    params: {
                                                                      'category':
                                                                          serializeParam(
                                                                        categoriesCategoryRecord
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
                                                                            PageTransitionType.rightToLeft,
                                                                        duration:
                                                                            Duration(milliseconds: 250),
                                                                      ),
                                                                    },
                                                                  );
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
                                                                        categoriesCategoryRecord
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
                                                                                categoriesCategoryRecord.title,
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 15.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                      categoriesCategoryRecord.description,
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .chevron_right_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                    ),
                                                                  ],
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
                                          if (_model.searchFieldController
                                                      .text !=
                                                  null &&
                                              _model.searchFieldController
                                                      .text !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  List<CategoryRecord>>(
                                                future: (_model
                                                            .algoliaRequestCompleter1 ??=
                                                        Completer<
                                                            List<
                                                                CategoryRecord>>()
                                                          ..complete(
                                                              CategoryRecord
                                                                  .search(
                                                            term: _model
                                                                .searchFieldController
                                                                .text,
                                                            maxResults: 10,
                                                            useCache: true,
                                                          )))
                                                    .future,
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
                                                  List<CategoryRecord>
                                                      categoriesSearchCategoryRecordList =
                                                      snapshot.data!;
                                                  if (categoriesSearchCategoryRecordList
                                                      .isEmpty) {
                                                    return NoEntriesWidget(
                                                      text:
                                                          'Keine Suchergebnisse.',
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
                                                        categoriesSearchCategoryRecordList
                                                            .length,
                                                        (categoriesSearchIndex) {
                                                      final categoriesSearchCategoryRecord =
                                                          categoriesSearchCategoryRecordList[
                                                              categoriesSearchIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PASSION_SEARCH_PAGE_Tag_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Tag_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'CategoryWindow',
                                                                  params: {
                                                                    'category':
                                                                        serializeParam(
                                                                      categoriesSearchCategoryRecord
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
                                                                          PageTransitionType
                                                                              .rightToLeft,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              250),
                                                                    ),
                                                                  },
                                                                );
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
                                                                      categoriesSearchCategoryRecord
                                                                          .image,
                                                                      'https://firebasestorage.googleapis.com/v0/b/repassion-9ce5f.appspot.com/o/empty_article.jpg?alt=media&token=d8786d27-f588-4e24-8a60-2deb0358a439',
                                                                    ),
                                                                    width: 50.0,
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
                                                                              categoriesSearchCategoryRecord.title,
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 15.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                    categoriesSearchCategoryRecord.description,
                                                                                    textAlign: TextAlign.start,
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .chevron_right_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          35.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation2']!),
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
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PASSION_SEARCH_CurrentPassion_ON_TAP');
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
                                                                  .title,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Weiterlesen',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                                                            'PASSION_SEARCH_PAGE_Icon_ole5hdea_ON_TAP');
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
                                                        logFirebaseEvent(
                                                            'Icon_refresh_database_request');
                                                        setState(() => _model
                                                                .algoliaRequestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForAlgoliaRequestCompleted2();
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .favorite_border_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                                            'PASSION_SEARCH_PAGE_Icon_w9k7ext1_ON_TAP');
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
                                                        logFirebaseEvent(
                                                            'Icon_refresh_database_request');
                                                        setState(() => _model
                                                                .algoliaRequestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForAlgoliaRequestCompleted2();
                                                      },
                                                      child: Icon(
                                                        Icons.favorite_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Icon(
                                        Icons.search_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 35.0,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PASSION_SEARCH_Container_dr7e05b8_ON_TAP');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'PassionFavorite',
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
                                          Icons.favorite_border_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PASSION_SEARCH_Container_q1azyby2_ON_TAP');
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
