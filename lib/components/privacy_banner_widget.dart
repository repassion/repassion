import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_banner_model.dart';
export 'privacy_banner_model.dart';

class PrivacyBannerWidget extends StatefulWidget {
  const PrivacyBannerWidget({Key? key}) : super(key: key);

  @override
  _PrivacyBannerWidgetState createState() => _PrivacyBannerWidgetState();
}

class _PrivacyBannerWidgetState extends State<PrivacyBannerWidget>
    with TickerProviderStateMixin {
  late PrivacyBannerModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyBannerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Allgemeine Geschäftsbedingungen',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'Ich stimme den Geschäftsbedingungen der App \"repassion\" zu und willige damit der Verarbeitung meiner Daten nach \nhttps://repassion.de/datenschutz \nein.',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PRIVACY_BANNER_Container_vxpxf0i0_ON_TAP');
                      logFirebaseEvent('Container_launch_u_r_l');
                      await launchURL('https://repassion.de/datenschutz');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 25.0, 25.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Weitere Informationen',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.open_in_new_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PRIVACY_BANNER_Container_skb3nl6p_ON_TAP');
                        logFirebaseEvent('Container_backend_call');

                        final userUpdateData = createUserRecordData(
                          privacyVersion: '1.0',
                        );
                        await currentUserReference!.update(userUpdateData);
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context, true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 25.0, 25.0, 25.0),
                            child: Text(
                              'Zustimmen und fortfahren',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
