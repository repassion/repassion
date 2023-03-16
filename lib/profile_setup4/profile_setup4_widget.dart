import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/max_main_tags_warning_widget.dart';
import '/components/no_entries_widget.dart';
import '/components/tag_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_setup4_model.dart';
export 'profile_setup4_model.dart';

class ProfileSetup4Widget extends StatefulWidget {
  const ProfileSetup4Widget({
    Key? key,
    this.searchText,
  }) : super(key: key);

  final String? searchText;

  @override
  _ProfileSetup4WidgetState createState() => _ProfileSetup4WidgetState();
}

class _ProfileSetup4WidgetState extends State<ProfileSetup4Widget> {
  late ProfileSetup4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileSetup4Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileSetup4'});
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.125,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 25.0, 25.0, 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_SETUP4_PAGE_Row_9pysk548_ON_TAP');
                                  logFirebaseEvent('Row_navigate_back');
                                  context.pop();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chevron_left_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50.0,
                                    ),
                                    Text(
                                      'Tags hinzufügen',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.875,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 25.0, 25.0, 25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: TextFormField(
                                  controller: _model.searchFieldController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchFieldController',
                                    Duration(milliseconds: 250),
                                    () async {
                                      logFirebaseEvent(
                                          'PROFILE_SETUP4_SearchField_ON_TEXTFIELD_');
                                      logFirebaseEvent(
                                          'SearchField_refresh_database_request');
                                      setState(() => _model
                                          .algoliaRequestCompleter = null);
                                      await _model
                                          .waitForAlgoliaRequestCompleted();
                                    },
                                  ),
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Suche',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                    hintText: 'Tags durchsuchen',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family),
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
                                            .primaryColor,
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
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDA2C38),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    suffixIcon: _model.searchFieldController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.searchFieldController
                                                  ?.clear();
                                              logFirebaseEvent(
                                                  'PROFILE_SETUP4_SearchField_ON_TEXTFIELD_');
                                              logFirebaseEvent(
                                                  'SearchField_refresh_database_request');
                                              setState(() => _model
                                                      .algoliaRequestCompleter =
                                                  null);
                                              await _model
                                                  .waitForAlgoliaRequestCompleted();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  validator: _model
                                      .searchFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (_model.searchFieldController
                                                      .text !=
                                                  null &&
                                              _model.searchFieldController
                                                      .text !=
                                                  '')
                                            FutureBuilder<List<TagRecord>>(
                                              future:
                                                  (_model.algoliaRequestCompleter ??=
                                                          Completer<
                                                              List<TagRecord>>()
                                                            ..complete(TagRecord
                                                                .search(
                                                              term: _model
                                                                  .searchFieldController
                                                                  .text,
                                                              maxResults: 25,
                                                            )))
                                                      .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: TagLoadingWidget(),
                                                  );
                                                }
                                                List<TagRecord>
                                                    searchColumnTagRecordList =
                                                    snapshot.data!;
                                                if (searchColumnTagRecordList
                                                    .isEmpty) {
                                                  return NoEntriesWidget(
                                                    text:
                                                        'Keine Suchergebnisse.',
                                                  );
                                                }
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      searchColumnTagRecordList
                                                          .length,
                                                      (searchColumnIndex) {
                                                    final searchColumnTagRecord =
                                                        searchColumnTagRecordList[
                                                            searchColumnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          if ((currentUserDocument
                                                                          ?.tags
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      searchColumnTagRecord
                                                                          .reference) ==
                                                              false)
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PROFILE_SETUP4_Container_u2608x0c_ON_TAP');
                                                                  if ((currentUserDocument?.tags?.toList() ??
                                                                              [])
                                                                          .length <
                                                                      15) {
                                                                    logFirebaseEvent(
                                                                        'Container_backend_call');

                                                                    final userUpdateData =
                                                                        {
                                                                      'tags': FieldValue
                                                                          .arrayUnion([
                                                                        searchColumnTagRecord
                                                                            .reference
                                                                      ]),
                                                                    };
                                                                    await currentUserReference!
                                                                        .update(
                                                                            userUpdateData);
                                                                    logFirebaseEvent(
                                                                        'Container_clear_text_fields');
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .searchFieldController
                                                                          ?.clear();
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'Container_refresh_database_request');
                                                                    setState(() =>
                                                                        _model.algoliaRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForAlgoliaRequestCompleted();
                                                                    logFirebaseEvent(
                                                                        'Container_refresh_database_request');
                                                                    setState(() =>
                                                                        _model.firestoreRequestCompleter1 =
                                                                            null);
                                                                    await _model
                                                                        .waitForFirestoreRequestCompleted1();
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              MaxMainTagsWarningWidget(
                                                                            text:
                                                                                'Du kannst maximal 15 Tags auswählen.',
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            searchColumnTagRecord.text!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_SETUP4_PAGE_Icon_p4o13noc_ON_TAP');
                                                                            if ((currentUserDocument?.mainTags?.toList() ?? []).length <
                                                                                3) {
                                                                              logFirebaseEvent('Icon_backend_call');

                                                                              final userUpdateData1 = {
                                                                                'main_tags': FieldValue.arrayUnion([
                                                                                  searchColumnTagRecord.reference
                                                                                ]),
                                                                              };
                                                                              await currentUserReference!.update(userUpdateData1);
                                                                              logFirebaseEvent('Icon_backend_call');

                                                                              final userUpdateData2 = {
                                                                                'tags': FieldValue.arrayUnion([
                                                                                  searchColumnTagRecord.reference
                                                                                ]),
                                                                              };
                                                                              await currentUserReference!.update(userUpdateData2);
                                                                              logFirebaseEvent('Icon_clear_text_fields');
                                                                              setState(() {
                                                                                _model.searchFieldController?.clear();
                                                                              });
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.algoliaRequestCompleter = null);
                                                                              await _model.waitForAlgoliaRequestCompleted();
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.firestoreRequestCompleter1 = null);
                                                                              await _model.waitForFirestoreRequestCompleted1();
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.firestoreRequestCompleter2 = null);
                                                                              await _model.waitForFirestoreRequestCompleted2();
                                                                            } else {
                                                                              logFirebaseEvent('Icon_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: MaxMainTagsWarningWidget(
                                                                                      text: 'Du kannst maximal 3 Tags hervorheben.',
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            }
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_border_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .add_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if ((currentUserDocument
                                                                          ?.tags
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      searchColumnTagRecord
                                                                          .reference) ==
                                                              true)
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PROFILE_SETUP4_Container_av91nhsf_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Container_backend_call');

                                                                  final userUpdateData1 =
                                                                      {
                                                                    'tags': FieldValue
                                                                        .arrayRemove([
                                                                      searchColumnTagRecord
                                                                          .reference
                                                                    ]),
                                                                  };
                                                                  await currentUserReference!
                                                                      .update(
                                                                          userUpdateData1);
                                                                  if ((currentUserDocument?.mainTags?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              searchColumnTagRecord.reference) ==
                                                                      true) {
                                                                    logFirebaseEvent(
                                                                        'Container_backend_call');

                                                                    final userUpdateData2 =
                                                                        {
                                                                      'main_tags':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        searchColumnTagRecord
                                                                            .reference
                                                                      ]),
                                                                    };
                                                                    await currentUserReference!
                                                                        .update(
                                                                            userUpdateData2);
                                                                  }
                                                                  logFirebaseEvent(
                                                                      'Container_clear_text_fields');
                                                                  setState(() {
                                                                    _model
                                                                        .searchFieldController
                                                                        ?.clear();
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'Container_refresh_database_request');
                                                                  setState(() =>
                                                                      _model.algoliaRequestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForAlgoliaRequestCompleted();
                                                                  logFirebaseEvent(
                                                                      'Container_refresh_database_request');
                                                                  setState(() =>
                                                                      _model.firestoreRequestCompleter1 =
                                                                          null);
                                                                  await _model
                                                                      .waitForFirestoreRequestCompleted1();
                                                                  logFirebaseEvent(
                                                                      'Container_refresh_database_request');
                                                                  setState(() =>
                                                                      _model.firestoreRequestCompleter2 =
                                                                          null);
                                                                  await _model
                                                                      .waitForFirestoreRequestCompleted2();
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            searchColumnTagRecord.text!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if ((currentUserDocument?.mainTags?.toList() ?? []).contains(searchColumnTagRecord.reference) ==
                                                                            false)
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('PROFILE_SETUP4_PAGE_Icon_xe4voiaw_ON_TAP');
                                                                              if ((currentUserDocument?.mainTags?.toList() ?? []).length < 3) {
                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                final userUpdateData = {
                                                                                  'main_tags': FieldValue.arrayUnion([
                                                                                    searchColumnTagRecord.reference
                                                                                  ]),
                                                                                };
                                                                                await currentUserReference!.update(userUpdateData);
                                                                                logFirebaseEvent('Icon_clear_text_fields');
                                                                                setState(() {
                                                                                  _model.searchFieldController?.clear();
                                                                                });
                                                                                logFirebaseEvent('Icon_refresh_database_request');
                                                                                setState(() => _model.algoliaRequestCompleter = null);
                                                                                await _model.waitForAlgoliaRequestCompleted();
                                                                                logFirebaseEvent('Icon_refresh_database_request');
                                                                                setState(() => _model.firestoreRequestCompleter1 = null);
                                                                                await _model.waitForFirestoreRequestCompleted1();
                                                                                logFirebaseEvent('Icon_refresh_database_request');
                                                                                setState(() => _model.firestoreRequestCompleter2 = null);
                                                                                await _model.waitForFirestoreRequestCompleted2();
                                                                              } else {
                                                                                logFirebaseEvent('Icon_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: MaxMainTagsWarningWidget(
                                                                                        text: 'Du kannst maximal 3 Tags hervorheben.',
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              }
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.star_border_sharp,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 25.0,
                                                                            ),
                                                                          ),
                                                                        if ((currentUserDocument?.mainTags?.toList() ?? []).contains(searchColumnTagRecord.reference) ==
                                                                            true)
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('PROFILE_SETUP4_PAGE_Icon_rfxof7np_ON_TAP');
                                                                              logFirebaseEvent('Icon_backend_call');

                                                                              final userUpdateData = {
                                                                                'main_tags': FieldValue.arrayRemove([
                                                                                  searchColumnTagRecord.reference
                                                                                ]),
                                                                              };
                                                                              await currentUserReference!.update(userUpdateData);
                                                                              logFirebaseEvent('Icon_clear_text_fields');
                                                                              setState(() {
                                                                                _model.searchFieldController?.clear();
                                                                              });
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.algoliaRequestCompleter = null);
                                                                              await _model.waitForAlgoliaRequestCompleted();
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.firestoreRequestCompleter1 = null);
                                                                              await _model.waitForFirestoreRequestCompleted1();
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.firestoreRequestCompleter2 = null);
                                                                              await _model.waitForFirestoreRequestCompleted2();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.star_sharp,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              size: 25.0,
                                                                            ),
                                                                          ),
                                                                        Icon(
                                                                          Icons
                                                                              .remove_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          if (_model.searchFieldController
                                                      .text ==
                                                  null ||
                                              _model.searchFieldController
                                                      .text ==
                                                  '')
                                            FutureBuilder<List<TagRecord>>(
                                              future: (_model
                                                          .firestoreRequestCompleter1 ??=
                                                      Completer<
                                                          List<TagRecord>>()
                                                        ..complete(
                                                            queryTagRecordOnce()))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: TagLoadingWidget(),
                                                  );
                                                }
                                                List<TagRecord>
                                                    tagColumnTagRecordList =
                                                    snapshot.data!;
                                                if (tagColumnTagRecordList
                                                    .isEmpty) {
                                                  return NoEntriesWidget(
                                                    text:
                                                        'Keine Tags ausgewählt.',
                                                  );
                                                }
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                        tagColumnTagRecordList
                                                            .length,
                                                        (tagColumnIndex) {
                                                      final tagColumnTagRecord =
                                                          tagColumnTagRecordList[
                                                              tagColumnIndex];
                                                      return Visibility(
                                                        visible: (currentUserDocument
                                                                        ?.mainTags
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    tagColumnTagRecord
                                                                        .reference) ==
                                                            true,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PROFILE_SETUP4_Container_lshkrz5f_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');

                                                                final userUpdateData1 =
                                                                    {
                                                                  'tags': FieldValue
                                                                      .arrayRemove([
                                                                    tagColumnTagRecord
                                                                        .reference
                                                                  ]),
                                                                };
                                                                await currentUserReference!
                                                                    .update(
                                                                        userUpdateData1);
                                                                if ((currentUserDocument?.mainTags?.toList() ??
                                                                            [])
                                                                        .contains(
                                                                            tagColumnTagRecord.reference) ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Container_backend_call');

                                                                  final userUpdateData2 =
                                                                      {
                                                                    'main_tags':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      tagColumnTagRecord
                                                                          .reference
                                                                    ]),
                                                                  };
                                                                  await currentUserReference!
                                                                      .update(
                                                                          userUpdateData2);
                                                                }
                                                                logFirebaseEvent(
                                                                    'Container_refresh_database_request');
                                                                setState(() =>
                                                                    _model.firestoreRequestCompleter1 =
                                                                        null);
                                                                await _model
                                                                    .waitForFirestoreRequestCompleted1();
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          tagColumnTagRecord
                                                                              .text!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if ((currentUserDocument?.mainTags?.toList() ?? [])
                                                                              .contains(tagColumnTagRecord.reference) ==
                                                                          true)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_SETUP4_PAGE_Icon_q1gsoafk_ON_TAP');
                                                                            logFirebaseEvent('Icon_backend_call');

                                                                            final userUpdateData =
                                                                                {
                                                                              'main_tags': FieldValue.arrayRemove([
                                                                                tagColumnTagRecord.reference
                                                                              ]),
                                                                            };
                                                                            await currentUserReference!.update(userUpdateData);
                                                                            logFirebaseEvent('Icon_refresh_database_request');
                                                                            setState(() =>
                                                                                _model.firestoreRequestCompleter1 = null);
                                                                            await _model.waitForFirestoreRequestCompleted1();
                                                                            logFirebaseEvent('Icon_refresh_database_request');
                                                                            setState(() =>
                                                                                _model.firestoreRequestCompleter2 = null);
                                                                            await _model.waitForFirestoreRequestCompleted2();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      Icon(
                                                                        Icons
                                                                            .remove_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (_model.searchFieldController
                                                      .text ==
                                                  null ||
                                              _model.searchFieldController
                                                      .text ==
                                                  '')
                                            FutureBuilder<List<TagRecord>>(
                                              future: (_model
                                                          .firestoreRequestCompleter2 ??=
                                                      Completer<
                                                          List<TagRecord>>()
                                                        ..complete(
                                                            queryTagRecordOnce()))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: TagLoadingWidget(),
                                                  );
                                                }
                                                List<TagRecord>
                                                    tagColumnTagRecordList =
                                                    snapshot.data!;
                                                if (tagColumnTagRecordList
                                                    .isEmpty) {
                                                  return NoEntriesWidget(
                                                    text:
                                                        'Keine Tags ausgewählt.',
                                                  );
                                                }
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                        tagColumnTagRecordList
                                                            .length,
                                                        (tagColumnIndex) {
                                                      final tagColumnTagRecord =
                                                          tagColumnTagRecordList[
                                                              tagColumnIndex];
                                                      return Visibility(
                                                        visible: ((currentUserDocument
                                                                            ?.mainTags
                                                                            ?.toList() ??
                                                                        [])
                                                                    .contains(
                                                                        tagColumnTagRecord
                                                                            .reference) !=
                                                                true) &&
                                                            ((currentUserDocument
                                                                            ?.tags
                                                                            ?.toList() ??
                                                                        [])
                                                                    .contains(
                                                                        tagColumnTagRecord
                                                                            .reference) ==
                                                                true),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PROFILE_SETUP4_Container_s9irrjnh_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');

                                                                final userUpdateData1 =
                                                                    {
                                                                  'tags': FieldValue
                                                                      .arrayRemove([
                                                                    tagColumnTagRecord
                                                                        .reference
                                                                  ]),
                                                                };
                                                                await currentUserReference!
                                                                    .update(
                                                                        userUpdateData1);
                                                                if ((currentUserDocument?.mainTags?.toList() ??
                                                                            [])
                                                                        .contains(
                                                                            tagColumnTagRecord.reference) ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Container_backend_call');

                                                                  final userUpdateData2 =
                                                                      {
                                                                    'main_tags':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      tagColumnTagRecord
                                                                          .reference
                                                                    ]),
                                                                  };
                                                                  await currentUserReference!
                                                                      .update(
                                                                          userUpdateData2);
                                                                }
                                                                logFirebaseEvent(
                                                                    'Container_refresh_database_request');
                                                                setState(() =>
                                                                    _model.firestoreRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForFirestoreRequestCompleted2();
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          tagColumnTagRecord
                                                                              .text!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if ((currentUserDocument?.mainTags?.toList() ?? [])
                                                                              .contains(tagColumnTagRecord.reference) !=
                                                                          true)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_SETUP4_PAGE_Icon_yl9ls4tu_ON_TAP');
                                                                            if ((currentUserDocument?.mainTags?.toList() ?? []).length <
                                                                                3) {
                                                                              logFirebaseEvent('Icon_backend_call');

                                                                              final userUpdateData = {
                                                                                'main_tags': FieldValue.arrayUnion([
                                                                                  tagColumnTagRecord.reference
                                                                                ]),
                                                                              };
                                                                              await currentUserReference!.update(userUpdateData);
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.firestoreRequestCompleter1 = null);
                                                                              await _model.waitForFirestoreRequestCompleted1();
                                                                              logFirebaseEvent('Icon_refresh_database_request');
                                                                              setState(() => _model.firestoreRequestCompleter2 = null);
                                                                              await _model.waitForFirestoreRequestCompleted2();
                                                                            } else {
                                                                              logFirebaseEvent('Icon_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: MaxMainTagsWarningWidget(
                                                                                      text: 'Du kannst maximal 3 Tags hervorheben.',
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            }
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_border_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      if ((currentUserDocument?.mainTags?.toList() ?? [])
                                                                              .contains(tagColumnTagRecord.reference) ==
                                                                          true)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_SETUP4_PAGE_Icon_4605wpjn_ON_TAP');
                                                                            logFirebaseEvent('Icon_backend_call');

                                                                            final userUpdateData =
                                                                                {
                                                                              'main_tags': FieldValue.arrayRemove([
                                                                                tagColumnTagRecord.reference
                                                                              ]),
                                                                            };
                                                                            await currentUserReference!.update(userUpdateData);
                                                                            logFirebaseEvent('Icon_refresh_database_request');
                                                                            setState(() =>
                                                                                _model.firestoreRequestCompleter1 = null);
                                                                            await _model.waitForFirestoreRequestCompleted1();
                                                                            logFirebaseEvent('Icon_refresh_database_request');
                                                                            setState(() =>
                                                                                _model.firestoreRequestCompleter2 = null);
                                                                            await _model.waitForFirestoreRequestCompleted2();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      Icon(
                                                                        Icons
                                                                            .remove_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x00EDF2F4),
                          FlutterFlowTheme.of(context).primaryBackground
                        ],
                        stops: [0.0, 0.5],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PROFILE_SETUP4_Container_u3nxb1zf_ON_TAP');
                          logFirebaseEvent('Container_haptic_feedback');
                          HapticFeedback.mediumImpact();
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            'ProfileSetup5',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Nächster Schritt',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
