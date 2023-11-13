import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'result_page_model.dart';
export 'result_page_model.dart';

class ResultPageWidget extends StatefulWidget {
  const ResultPageWidget({
    super.key,
    this.result,
  });

  final bool? result;

  @override
  State<ResultPageWidget> createState() => _ResultPageWidgetState();
}

class _ResultPageWidgetState extends State<ResultPageWidget>
    with TickerProviderStateMixin {
  late ResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(3, 3),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(3, 3),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  if (widget.result ?? false) {
                    return Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).success,
                            FlutterFlowTheme.of(context).tertiary
                          ],
                          stops: const [0, 0.5, 1],
                          begin: const AlignmentDirectional(-1, -1),
                          end: const AlignmentDirectional(1, 1),
                        ),
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x00FFFFFF),
                              FlutterFlowTheme.of(context).secondaryBackground
                            ],
                            stops: const [0, 1],
                            begin: const AlignmentDirectional(0, -1),
                            end: const AlignmentDirectional(0, 1),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent4,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Image.asset(
                                  'assets/images/checked.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                            'containerOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                              child: Text(
                                'Benign Tumor!',
                                style:
                                FlutterFlowTheme.of(context).displaySmall,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                              child: Text(
                                'The result is based on the entered data and has a prediction success rate of 99%.  This is just an assistant to the doctor and not the final diagnosis.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!);
                  } else {
                    return Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).error,
                            FlutterFlowTheme.of(context).tertiary
                          ],
                          stops: const [0, 0.5, 1],
                          begin: const AlignmentDirectional(-1, -1),
                          end: const AlignmentDirectional(1, 1),
                        ),
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x00FFFFFF),
                              FlutterFlowTheme.of(context).secondaryBackground
                            ],
                            stops: const [0, 1],
                            begin: const AlignmentDirectional(0, -1),
                            end: const AlignmentDirectional(0, 1),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent4,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Image.asset(
                                  'assets/images/cancel.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                            'containerOnPageLoadAnimation4']!),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                              child: Text(
                                'Malignant Tumor!',
                                style:
                                FlutterFlowTheme.of(context).displaySmall,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation3']!),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                              child: Text(
                                'The result is based on the entered data and has a prediction success rate of 99%.  This is just an assistant to the doctor and not the final diagnosis.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation4']!),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation3']!);
                  }
                },
              ),
            ),
            Builder(
              builder: (context) {
                if (widget.result ?? false) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 16),
                              child: FFButtonWidget(
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }

                                },
                                text: 'Back',
                                options: FFButtonOptions(
                                  width: 230,
                                  height: 52,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).success,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation1']!),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 16),
                              child: FFButtonWidget(
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }

                                },
                                text: 'Back',
                                options: FFButtonOptions(
                                  width: 230,
                                  height: 52,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation2']!),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
