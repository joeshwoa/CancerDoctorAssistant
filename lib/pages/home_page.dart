import 'package:cancer_doctor_assistant/pages/result_page.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  bool loading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  double sigmoid(double z) {
    return 1 / (1 + exp(-z));
  }

  double predictLR(List<double> features, List<double> weights, double bias) {
    double z = 0;
    for (int i = 0; i < features.length; i++) {
      z += features[i] * weights[i];
    }
    z += bias;
    return sigmoid(z);
  }

  double logisticRegression() {
    // Given weights and bias
    List<double> weights = [
      -0.12111163, 0.1069298, 0.40740337, 0.63907123, 0.27464015, 0.18786332,
      0.03159792, -0.05109517, -0.75769465, 0.80099274, 0.02713199, 0.01906679,
      0.10406553, 0.16871327, 0.04627115, 0.04958546, 0.00923372, 0.36072249,
      0.02668446, 0.19048801, 1.19598237, 1.65711429, 0.50137521, 0.49838072,
      0.10856499, -0.38041744, -0.60520725, -0.29759208, -0.36312283
    ];

    double bias = -0.25050851;

    // Example input features (replace this with your actual input)
    List<double> inputFeatures = [];

    inputFeatures.add(double.parse(_model.textController4.text));
    inputFeatures.add(double.parse(_model.textController13.text));
    inputFeatures.add(double.parse(_model.textController16.text));
    inputFeatures.add(double.parse(_model.textController19.text));
    inputFeatures.add(double.parse(_model.textController22.text));
    inputFeatures.add(double.parse(_model.textController25.text));
    inputFeatures.add(double.parse(_model.textController28.text));
    inputFeatures.add(double.parse(_model.textController2.text));
    inputFeatures.add(double.parse(_model.textController5.text));
    inputFeatures.add(double.parse(_model.textController8.text));
    inputFeatures.add(double.parse(_model.textController11.text));
    inputFeatures.add(double.parse(_model.textController14.text));
    inputFeatures.add(double.parse(_model.textController17.text));
    inputFeatures.add(double.parse(_model.textController20.text));
    inputFeatures.add(double.parse(_model.textController23.text));
    inputFeatures.add(double.parse(_model.textController26.text));
    inputFeatures.add(double.parse(_model.textController29.text));
    inputFeatures.add(double.parse(_model.textController6.text));
    inputFeatures.add(double.parse(_model.textController12.text));
    inputFeatures.add(double.parse(_model.textController15.text));
    inputFeatures.add(double.parse(_model.textController18.text));
    inputFeatures.add(double.parse(_model.textController21.text));
    inputFeatures.add(double.parse(_model.textController24.text));
    inputFeatures.add(double.parse(_model.textController27.text));
    inputFeatures.add(double.parse(_model.textController30.text));
    if(double.parse(_model.textController1.text) != 0) {
      inputFeatures.add(double.parse(_model.textController7.text)/double.parse(_model.textController1.text));
      inputFeatures.add(double.parse(_model.textController10.text)/double.parse(_model.textController1.text));
      inputFeatures.add(double.parse(_model.textController3.text)/double.parse(_model.textController1.text));
      inputFeatures.add(double.parse(_model.textController9.text)/double.parse(_model.textController1.text));
    } else {
      inputFeatures.add(double.parse(_model.textController7.text)/(double.parse(_model.textController1.text)+0.0000000001));
      inputFeatures.add(double.parse(_model.textController10.text)/(double.parse(_model.textController1.text)+0.0000000001));
      inputFeatures.add(double.parse(_model.textController3.text)/(double.parse(_model.textController1.text)+0.0000000001));
      inputFeatures.add(double.parse(_model.textController9.text)/(double.parse(_model.textController1.text)+0.0000000001));
    }


    // Make predictions
    double prediction = predictLR(inputFeatures, weights, bias);

    //print("Prediction: $prediction");

    return prediction;
  }

  double predictSVM(List<double> features, List<double> weights, double bias) {
    if (features.length != weights.length) {
      throw ArgumentError("Number of features must match the number of weights");
    }

    double result = -bias;
    for (int i = 0; i < features.length; i++) {
      result += features[i] * weights[i];
    }

    return result > 0 ? 1 : -1;
  }

  double svm() {
    // Given weights and bias
    List<double> weights = [
      -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0,
      -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0,
      -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0,
      -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0,
      -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0,
      -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
    ];

    double bias = 0.6453006;

    // Example input features (replace this with your actual input)
    List<double> inputFeatures = [];

    inputFeatures.add(double.parse(_model.textController1.text));
    inputFeatures.add(double.parse(_model.textController4.text));
    inputFeatures.add(double.parse(_model.textController7.text));
    inputFeatures.add(double.parse(_model.textController10.text));
    inputFeatures.add(double.parse(_model.textController13.text));
    inputFeatures.add(double.parse(_model.textController16.text));
    inputFeatures.add(double.parse(_model.textController19.text));
    inputFeatures.add(double.parse(_model.textController22.text));
    inputFeatures.add(double.parse(_model.textController25.text));
    inputFeatures.add(double.parse(_model.textController28.text));
    inputFeatures.add(double.parse(_model.textController2.text));
    inputFeatures.add(double.parse(_model.textController5.text));
    inputFeatures.add(double.parse(_model.textController8.text));
    inputFeatures.add(double.parse(_model.textController11.text));
    inputFeatures.add(double.parse(_model.textController14.text));
    inputFeatures.add(double.parse(_model.textController17.text));
    inputFeatures.add(double.parse(_model.textController20.text));
    inputFeatures.add(double.parse(_model.textController23.text));
    inputFeatures.add(double.parse(_model.textController26.text));
    inputFeatures.add(double.parse(_model.textController29.text));
    inputFeatures.add(double.parse(_model.textController3.text));
    inputFeatures.add(double.parse(_model.textController6.text));
    inputFeatures.add(double.parse(_model.textController9.text));
    inputFeatures.add(double.parse(_model.textController12.text));
    inputFeatures.add(double.parse(_model.textController15.text));
    inputFeatures.add(double.parse(_model.textController18.text));
    inputFeatures.add(double.parse(_model.textController21.text));
    inputFeatures.add(double.parse(_model.textController24.text));
    inputFeatures.add(double.parse(_model.textController27.text));
    inputFeatures.add(double.parse(_model.textController30.text));

    // Make predictions
    double prediction = predictSVM(inputFeatures, weights, bias);

    //print("Prediction: $prediction");

    return prediction;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController1 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController8 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode8 ??= FocusNode();

    _model.textController9 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode9 ??= FocusNode();

    _model.textController10 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode10 ??= FocusNode();

    _model.textController11 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode11 ??= FocusNode();

    _model.textController12 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode12 ??= FocusNode();

    _model.textController13 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode13 ??= FocusNode();

    _model.textController14 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode14 ??= FocusNode();

    _model.textController15 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode15 ??= FocusNode();

    _model.textController16 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode16 ??= FocusNode();

    _model.textController17 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode17 ??= FocusNode();

    _model.textController18 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode18 ??= FocusNode();

    _model.textController19 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode19 ??= FocusNode();

    _model.textController20 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode20 ??= FocusNode();

    _model.textController21 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode21 ??= FocusNode();

    _model.textController22 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode22 ??= FocusNode();

    _model.textController23 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode23 ??= FocusNode();

    _model.textController24 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode24 ??= FocusNode();

    _model.textController25 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode25 ??= FocusNode();

    _model.textController26 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode26 ??= FocusNode();

    _model.textController27 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode27 ??= FocusNode();

    _model.textController28 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode28 ??= FocusNode();

    _model.textController29 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode29 ??= FocusNode();

    _model.textController30 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode30 ??= FocusNode();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Cancer Doctor Assistant',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: FlutterFlowTheme.of(context).accent4
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Radius mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController1Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Radius se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController2,
                                        focusNode: _model.textFieldFocusNode2,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController2Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Radius worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController3,
                                        focusNode: _model.textFieldFocusNode3,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController3Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Texture  mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController4,
                                        focusNode: _model.textFieldFocusNode4,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController4Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Texture  se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController5,
                                        focusNode: _model.textFieldFocusNode5,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController5Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Texture  worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController6,
                                        focusNode: _model.textFieldFocusNode6,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController6Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Perimeter mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController7,
                                        focusNode: _model.textFieldFocusNode7,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController7Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Perimeter se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController8,
                                        focusNode: _model.textFieldFocusNode8,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController8Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Perimeter worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController9,
                                        focusNode: _model.textFieldFocusNode9,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model.textController9Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Area mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController10,
                                        focusNode: _model.textFieldFocusNode10,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController10Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Area se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController11,
                                        focusNode: _model.textFieldFocusNode11,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController11Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Area worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController12,
                                        focusNode: _model.textFieldFocusNode12,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController12Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Smoothness mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController13,
                                        focusNode: _model.textFieldFocusNode13,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController13Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Smoothness se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController14,
                                        focusNode: _model.textFieldFocusNode14,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController14Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Smoothness worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController15,
                                        focusNode: _model.textFieldFocusNode15,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController15Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Compactness mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController16,
                                        focusNode: _model.textFieldFocusNode16,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController16Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Compactness se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController17,
                                        focusNode: _model.textFieldFocusNode17,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController17Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Compactness worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController18,
                                        focusNode: _model.textFieldFocusNode18,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController18Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concavity mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController19,
                                        focusNode: _model.textFieldFocusNode19,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController19Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concavity se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController20,
                                        focusNode: _model.textFieldFocusNode20,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController20Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concavity worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController21,
                                        focusNode: _model.textFieldFocusNode21,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController21Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concave points mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController22,
                                        focusNode: _model.textFieldFocusNode22,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController22Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concave points se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController23,
                                        focusNode: _model.textFieldFocusNode23,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController23Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concave points worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController24,
                                        focusNode: _model.textFieldFocusNode24,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController24Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Symmetry mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController25,
                                        focusNode: _model.textFieldFocusNode25,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController25Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Symmetry se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController26,
                                        focusNode: _model.textFieldFocusNode26,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController26Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Symmetry worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController27,
                                        focusNode: _model.textFieldFocusNode27,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController27Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fractal dimension mean',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController28,
                                        focusNode: _model.textFieldFocusNode28,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController28Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fractal dimension se',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController29,
                                        focusNode: _model.textFieldFocusNode29,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController29Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fractal dimension worst',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0x3818AA99),
                                          Color(0x3818AA99)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _model.textController30,
                                        focusNode: _model.textFieldFocusNode30,
                                        autofocus: true,
                                        textInputAction: TextInputAction.done,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent1,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .accent2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false, decimal: true),
                                        validator: _model
                                            .textController30Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          
                                        ],
                                      ),
                                    ),
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
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(!loading)FFButtonWidget(
                      onPressed: () {
                        if(!loading) {
                          setState(() {
                            _model.textController1.text  = '0';
                            _model.textController4.text  = '0';
                            _model.textController7.text  = '0';
                            _model.textController10.text  = '0';
                            _model.textController13.text  = '0';
                            _model.textController16.text  = '0';
                            _model.textController19.text  = '0';
                            _model.textController22.text  = '0';
                            _model.textController25.text  = '0';
                            _model.textController28.text  = '0';
                            _model.textController2.text  = '0';
                            _model.textController5.text  = '0';
                            _model.textController8.text  = '0';
                            _model.textController11.text  = '0';
                            _model.textController14.text  = '0';
                            _model.textController17.text  = '0';
                            _model.textController20.text  = '0';
                            _model.textController23.text  = '0';
                            _model.textController26.text  = '0';
                            _model.textController29.text  = '0';
                            _model.textController3.text  = '0';
                            _model.textController6.text  = '0';
                            _model.textController9.text  = '0';
                            _model.textController12.text  = '0';
                            _model.textController15.text  = '0';
                            _model.textController18.text  = '0';
                            _model.textController21.text  = '0';
                            _model.textController24.text  = '0';
                            _model.textController27.text  = '0';
                            _model.textController30.text  = '0';
                          });
                        }
                      },
                      text: 'Clear',
                      options: FFButtonOptions(
                        height: 40,
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                    FFButtonWidget(
                      onPressed: () {
                        if(!loading && _model.formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          double prediction = logisticRegression();
                          if(prediction >= 0.5) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultPageWidget(result: false),));
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultPageWidget(result: true),));
                          }

                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      text: loading?'Loading ...':'Show Result',
                      options: FFButtonOptions(
                        height: 40,
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: loading?FlutterFlowTheme.of(context).accent3:FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
