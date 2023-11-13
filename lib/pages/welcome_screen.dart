import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'welcome_screen_model.dart';
export 'welcome_screen_model.dart';

class WelcomeScreenWidget extends StatefulWidget {
  const WelcomeScreenWidget({super.key});

  @override
  State<WelcomeScreenWidget> createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget> {
  late WelcomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreenModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/doctors_fight_cancer.png',
              ).image,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x80FFFFFF), Color(0xB3FFFFFF)],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 64, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Welcome at CDA',
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 64, 16, 44),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cancer Doctor Assistant',
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'BETA',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'This application is used to help doctors and people who work in the field of medicine, specifically in the field of treating or diagnosing cancer, to help them know the status of the cancerous tumor, whether it is a benign tumor (its size is constant) or a malignant tumor (its size increases) with a success rate of up to 99% through  Enter some data that can be accessed through hearsay.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).accent1,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2, 2, 2, 2),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          'assets/images/warning.jpg',
                                          width: 44,
                                          height: 44,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Scope of this app',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Doctors',
                                              textAlign: TextAlign.start,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.go('/HomePage');
                                },
                                text: 'Start use',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primary,
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16)),
                        ),
                      ),
                    ],
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
