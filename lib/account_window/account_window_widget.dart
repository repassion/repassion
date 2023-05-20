import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_window_model.dart';
export 'account_window_model.dart';

class AccountWindowWidget extends StatefulWidget {
  const AccountWindowWidget({Key? key}) : super(key: key);

  @override
  _AccountWindowWidgetState createState() => _AccountWindowWidgetState();
}

class _AccountWindowWidgetState extends State<AccountWindowWidget> {
  late AccountWindowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountWindowModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AccountWindow'});
    _model.usernameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.eMailController ??= TextEditingController(text: currentUserEmail);
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
              constraints: BoxConstraints(
                maxWidth: 500.0,
                maxHeight: 1000.0,
              ),
              decoration: BoxDecoration(),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.always,
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
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ACCOUNT_WINDOW_PAGE_Row_iwgcl6wz_ON_TAP');
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
                                              .primary,
                                          size: 50.0,
                                        ),
                                        Text(
                                          'Konto verwalten',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
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
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => TextFormField(
                                        controller: _model.usernameController,
                                        autofillHints: [AutofillHints.name],
                                        textCapitalization:
                                            TextCapitalization.none,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Nutzername*',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          hintText: currentUserDisplayName,
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDA2C38),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType: TextInputType.name,
                                        validator: _model
                                            .usernameControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z0-9]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: TextFormField(
                                      controller: _model.eMailController,
                                      autofillHints: [AutofillHints.email],
                                      textCapitalization:
                                          TextCapitalization.none,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'E-Mail*',
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
                                        hintText: currentUserEmail,
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
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model.eMailControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ACCOUNT_WINDOW_PAGE_Setting_ON_TAP');
                                        logFirebaseEvent(
                                            'Setting_haptic_feedback');
                                        HapticFeedback.lightImpact();
                                        logFirebaseEvent('Setting_auth');
                                        if (_model
                                            .eMailController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Die E-Mail wird benötigt',
                                              ),
                                            ),
                                          );
                                          return;
                                        }
                                        await authManager.resetPassword(
                                          email: _model.eMailController.text,
                                          context: context,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 200.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Icon(
                                                      Icons.security,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Passwort zurücksetzen',
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Link zum Zurücksetzen senden',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
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
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 25.0,
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
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ACCOUNT_WINDOW_Container_2q4hto3a_ON_TAP');
                              logFirebaseEvent('Container_haptic_feedback');
                              HapticFeedback.mediumImpact();
                              logFirebaseEvent('Container_validate_form');
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              logFirebaseEvent('Container_navigate_back');
                              context.pop();
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Änderungen speichern',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
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
