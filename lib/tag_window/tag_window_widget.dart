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
import 'tag_window_model.dart';
export 'tag_window_model.dart';

class TagWindowWidget extends StatefulWidget {
  const TagWindowWidget({
    Key? key,
    this.searchText,
  }) : super(key: key);

  final String? searchText;

  @override
  _TagWindowWidgetState createState() => _TagWindowWidgetState();
}

class _TagWindowWidgetState extends State<TagWindowWidget> {
  late TagWindowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagWindowModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TagWindow'});
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 500.0,
                maxHeight: 1000.0,
              ),
              decoration: BoxDecoration(),
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
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 25.0, 25.0, 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'TAG_WINDOW_PAGE_Row_i8wuk468_ON_TAP');
                                      logFirebaseEvent('Row_navigate_back');
                                      context.pop();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.chevron_left_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50.0,
                                        ),
                                        Text(
                                          'Tags bearbeiten',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                                              'TAG_WINDOW_SearchField_ON_TEXTFIELD_CHAN');
                                          logFirebaseEvent(
                                              'SearchField_refresh_database_request');
                                          setState(() => _model
                                              .algoliaRequestCompleter = null);
                                          await _model
                                              .waitForAlgoliaRequestCompleted();
                                        },
                                      ),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Suche',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                        hintText: 'Tags durchsuchen',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      'TAG_WINDOW_SearchField_ON_TEXTFIELD_CHAN');
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
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
                                            MediaQuery.of(context).size.width *
                                                1.0,
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
                                                  future: (_model
                                                              .algoliaRequestCompleter ??=
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
                                                        child:
                                                            TagLoadingWidget(),
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
                                                                MainAxisSize
                                                                    .min,
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
                                                                          'TAG_WINDOW_Container_fte2lwx2_ON_TAP');
                                                                      if ((currentUserDocument?.tags?.toList() ?? [])
                                                                              .length <
                                                                          15) {
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        final userUpdateData =
                                                                            {
                                                                          'tags':
                                                                              FieldValue.arrayUnion([
                                                                            searchColumnTagRecord.reference
                                                                          ]),
                                                                        };
                                                                        await currentUserReference!
                                                                            .update(userUpdateData);
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
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                              child: MaxMainTagsWarningWidget(
                                                                                text: 'Du kannst maximal 15 Tags auswählen.',
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
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
                                                                              onTap: () async {
                                                                                logFirebaseEvent('TAG_WINDOW_PAGE_Icon_0s532k7j_ON_TAP');
                                                                                if ((currentUserDocument?.mainTags?.toList() ?? []).length < 3) {
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
                                                                              child: Icon(
                                                                                Icons.star_border_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.add_sharp,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 25.0,
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
                                                                          'TAG_WINDOW_Container_1yjz4y1r_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      final userUpdateData1 =
                                                                          {
                                                                        'tags':
                                                                            FieldValue.arrayRemove([
                                                                          searchColumnTagRecord
                                                                              .reference
                                                                        ]),
                                                                      };
                                                                      await currentUserReference!
                                                                          .update(
                                                                              userUpdateData1);
                                                                      if ((currentUserDocument?.mainTags?.toList() ?? [])
                                                                              .contains(searchColumnTagRecord.reference) ==
                                                                          true) {
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        final userUpdateData2 =
                                                                            {
                                                                          'main_tags':
                                                                              FieldValue.arrayRemove([
                                                                            searchColumnTagRecord.reference
                                                                          ]),
                                                                        };
                                                                        await currentUserReference!
                                                                            .update(userUpdateData2);
                                                                      }
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
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
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
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('TAG_WINDOW_PAGE_Icon_sjfs1w7b_ON_TAP');
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
                                                                                child: Icon(
                                                                                  Icons.star_border_sharp,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 25.0,
                                                                                ),
                                                                              ),
                                                                            if ((currentUserDocument?.mainTags?.toList() ?? []).contains(searchColumnTagRecord.reference) ==
                                                                                true)
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('TAG_WINDOW_PAGE_Icon_dk8ht5km_ON_TAP');
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
                                                                                child: Icon(
                                                                                  Icons.star_sharp,
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  size: 25.0,
                                                                                ),
                                                                              ),
                                                                            Icon(
                                                                              Icons.remove_sharp,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              size: 25.0,
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
                                                        child:
                                                            TagLoadingWidget(),
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
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TAG_WINDOW_Container_f0hnqmvo_ON_TAP');
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
                                                                            .contains(tagColumnTagRecord.reference) ==
                                                                        true) {
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      final userUpdateData2 =
                                                                          {
                                                                        'main_tags':
                                                                            FieldValue.arrayRemove([
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
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              tagColumnTagRecord.text!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if ((currentUserDocument?.mainTags?.toList() ?? []).contains(tagColumnTagRecord.reference) ==
                                                                              true)
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('TAG_WINDOW_PAGE_Icon_m5qz23tu_ON_TAP');
                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                final userUpdateData = {
                                                                                  'main_tags': FieldValue.arrayRemove([
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
                                                                              },
                                                                              child: Icon(
                                                                                Icons.star_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          Icon(
                                                                            Icons.remove_sharp,
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
                                                        child:
                                                            TagLoadingWidget(),
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
                                                            visible: ((currentUserDocument?.mainTags?.toList() ??
                                                                            [])
                                                                        .contains(tagColumnTagRecord
                                                                            .reference) !=
                                                                    true) &&
                                                                ((currentUserDocument?.tags?.toList() ??
                                                                            [])
                                                                        .contains(
                                                                            tagColumnTagRecord.reference) ==
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
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TAG_WINDOW_Container_mzhpqekg_ON_TAP');
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
                                                                            .contains(tagColumnTagRecord.reference) ==
                                                                        true) {
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      final userUpdateData2 =
                                                                          {
                                                                        'main_tags':
                                                                            FieldValue.arrayRemove([
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
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              tagColumnTagRecord.text!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if ((currentUserDocument?.mainTags?.toList() ?? []).contains(tagColumnTagRecord.reference) !=
                                                                              true)
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('TAG_WINDOW_PAGE_Icon_lk1b9swh_ON_TAP');
                                                                                if ((currentUserDocument?.mainTags?.toList() ?? []).length < 3) {
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
                                                                              child: Icon(
                                                                                Icons.star_border_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          if ((currentUserDocument?.mainTags?.toList() ?? []).contains(tagColumnTagRecord.reference) ==
                                                                              true)
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('TAG_WINDOW_PAGE_Icon_5xbdb5es_ON_TAP');
                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                final userUpdateData = {
                                                                                  'main_tags': FieldValue.arrayRemove([
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
                                                                              },
                                                                              child: Icon(
                                                                                Icons.star_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          Icon(
                                                                            Icons.remove_sharp,
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
                              FlutterFlowTheme.of(context).gradient1,
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
                                  'TAG_WINDOW_Container_x91s91ax_ON_TAP');
                              logFirebaseEvent('Container_haptic_feedback');
                              HapticFeedback.mediumImpact();
                              logFirebaseEvent('Container_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Alle zurücksetzen bestätigen'),
                                            content: Text(
                                                'Willst du wirklich all deine Tags zurücksetzen?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Nein'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Ja'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent('Container_backend_call');

                                final userUpdateData = {
                                  'tags': FieldValue.delete(),
                                  'main_tags': FieldValue.delete(),
                                };
                                await currentUserReference!
                                    .update(userUpdateData);
                                logFirebaseEvent(
                                    'Container_refresh_database_request');
                                setState(() =>
                                    _model.algoliaRequestCompleter = null);
                                await _model.waitForAlgoliaRequestCompleted();
                                logFirebaseEvent(
                                    'Container_refresh_database_request');
                                setState(() =>
                                    _model.firestoreRequestCompleter1 = null);
                                await _model
                                    .waitForFirestoreRequestCompleted1();
                              }
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Alle zurücksetzen',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
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
        ),
      ),
    );
  }
}
