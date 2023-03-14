import '/auth/auth_util.dart';
import '/backend/backend.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileSetup4Model());

    _model.searchFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
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
                          mainAxisSize: MainAxisSize.max,
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
                                    setState(() =>
                                        _model.algoliaRequestCompleter = null);
                                    await _model
                                        .waitForAlgoliaRequestCompleter();
                                  },
                                ),
                                autofocus: true,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Suche',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                  suffixIcon: _model.searchFieldController!.text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.searchFieldController
                                                ?.clear();
                                            setState(() =>
                                                _model.algoliaRequestCompleter =
                                                    null);
                                            await _model
                                                .waitForAlgoliaRequestCompleter();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 15.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                validator: _model.searchFieldControllerValidator
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.searchFieldController.text !=
                                              null &&
                                          _model.searchFieldController.text !=
                                              '')
                                        FutureBuilder<List<TagRecord>>(
                                          future:
                                              (_model.algoliaRequestCompleter ??=
                                                      Completer<
                                                          List<TagRecord>>()
                                                        ..complete(
                                                            TagRecord.search(
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
                                                text: 'Keine Suchergebnisse.',
                                              );
                                            }
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    searchColumnTagRecordList
                                                        .length,
                                                    (searchColumnIndex) {
                                                  final searchColumnTagRecord =
                                                      searchColumnTagRecordList[
                                                          searchColumnIndex];
                                                  return Column(
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              onTap: () async {
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
                                                                setState(() =>
                                                                    _model.algoliaRequestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForAlgoliaRequestCompleter();
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
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
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
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        searchColumnTagRecord
                                                                            .text!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              fontSize: 12.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          final userUpdateData1 =
                                                                              {
                                                                            'tags':
                                                                                FieldValue.arrayUnion([
                                                                              searchColumnTagRecord.reference
                                                                            ]),
                                                                          };
                                                                          await currentUserReference!
                                                                              .update(userUpdateData1);

                                                                          final userUpdateData2 =
                                                                              {
                                                                            'main_tags':
                                                                                FieldValue.arrayUnion([
                                                                              searchColumnTagRecord.reference
                                                                            ]),
                                                                          };
                                                                          await currentUserReference!
                                                                              .update(userUpdateData2);
                                                                          setState(() =>
                                                                              _model.algoliaRequestCompleter = null);
                                                                          await _model
                                                                              .waitForAlgoliaRequestCompleter();
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .star_border_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              onTap: () async {
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
                                                                setState(() =>
                                                                    _model.algoliaRequestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForAlgoliaRequestCompleter();
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      Color(
                                                                          0xFFBBBEA5)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    end: AlignmentDirectional(
                                                                        -1.0,
                                                                        0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
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
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        searchColumnTagRecord
                                                                            .text!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              fontSize: 12.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                      if ((currentUserDocument?.mainTags?.toList() ?? [])
                                                                              .contains(searchColumnTagRecord.reference) ==
                                                                          false)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            final userUpdateData =
                                                                                {
                                                                              'main_tags': FieldValue.arrayUnion([
                                                                                searchColumnTagRecord.reference
                                                                              ]),
                                                                            };
                                                                            await currentUserReference!.update(userUpdateData);
                                                                            setState(() =>
                                                                                _model.algoliaRequestCompleter = null);
                                                                            await _model.waitForAlgoliaRequestCompleter();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_border_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      if ((currentUserDocument?.mainTags?.toList() ?? [])
                                                                              .contains(searchColumnTagRecord.reference) ==
                                                                          true)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            final userUpdateData =
                                                                                {
                                                                              'main_tags': FieldValue.arrayRemove([
                                                                                searchColumnTagRecord.reference
                                                                              ]),
                                                                            };
                                                                            await currentUserReference!.update(userUpdateData);
                                                                            setState(() =>
                                                                                _model.algoliaRequestCompleter = null);
                                                                            await _model.waitForAlgoliaRequestCompleter();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      if (_model.searchFieldController.text ==
                                              null ||
                                          _model.searchFieldController.text ==
                                              '')
                                        FutureBuilder<List<TagRecord>>(
                                          future: (_model
                                                      .firestoreRequestCompleter ??=
                                                  Completer<List<TagRecord>>()
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
                                                text: 'Keine Tags ausgewählt.',
                                              );
                                            }
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    tagColumnTagRecordList
                                                        .length,
                                                    (tagColumnIndex) {
                                                  final tagColumnTagRecord =
                                                      tagColumnTagRecordList[
                                                          tagColumnIndex];
                                                  return Visibility(
                                                    visible: (currentUserDocument
                                                                    ?.tags
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
                                                                  1.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          onTap: () async {
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
                                                            if ((currentUserDocument
                                                                            ?.mainTags
                                                                            ?.toList() ??
                                                                        [])
                                                                    .contains(
                                                                        tagColumnTagRecord
                                                                            .reference) ==
                                                                true) {
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
                                                            setState(() => _model
                                                                    .firestoreRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForFirestoreRequestCompleter();
                                                          },
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  Color(
                                                                      0xFFBBBEA5)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    tagColumnTagRecord
                                                                        .text!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              12.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                  if ((currentUserDocument?.mainTags?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              tagColumnTagRecord.reference) ==
                                                                      false)
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        final userUpdateData =
                                                                            {
                                                                          'main_tags':
                                                                              FieldValue.arrayUnion([
                                                                            tagColumnTagRecord.reference
                                                                          ]),
                                                                        };
                                                                        await currentUserReference!
                                                                            .update(userUpdateData);
                                                                        setState(() =>
                                                                            _model.firestoreRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForFirestoreRequestCompleter();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .star_border_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  if ((currentUserDocument?.mainTags?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              tagColumnTagRecord.reference) ==
                                                                      true)
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        final userUpdateData =
                                                                            {
                                                                          'main_tags':
                                                                              FieldValue.arrayRemove([
                                                                            tagColumnTagRecord.reference
                                                                          ]),
                                                                        };
                                                                        await currentUserReference!
                                                                            .update(userUpdateData);
                                                                        setState(() =>
                                                                            _model.firestoreRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForFirestoreRequestCompleter();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .star_sharp,
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
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
                    child: InkWell(
                      onTap: () async {
                        HapticFeedback.mediumImpact();

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
    );
  }
}
