import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatefulWidget {
  const ProductViewWidget({
    Key? key,
    this.plantRef,
  }) : super(key: key);

  final DocumentReference? plantRef;

  @override
  _ProductViewWidgetState createState() => _ProductViewWidgetState();
}

class _ProductViewWidgetState extends State<ProductViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PlantsRecord>(
      stream: PlantsRecord.getDocument(widget.plantRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final productViewPlantsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.network(
                          productViewPlantsRecord.image!,
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                productViewPlantsRecord.name!,
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '₹',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                productViewPlantsRecord.price!.toString(),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  productViewPlantsRecord.desc!,
                                  style: FlutterFlowTheme.of(context).bodyText2,
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
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x2D000000),
                            offset: Offset(0, -2),
                          )
                        ],
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState()
                                .addTocart(productViewPlantsRecord.reference);
                          });
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(productViewPlantsRecord.name!),
                                content: Text('Added to cart'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        text: 'Add to cart',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
