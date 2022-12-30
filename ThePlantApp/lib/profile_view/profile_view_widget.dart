import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileViewWidget extends StatefulWidget {
  const ProfileViewWidget({Key? key}) : super(key: key);

  @override
  _ProfileViewWidgetState createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body :SingleChildScrollView(  
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.arrow_back_rounded,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 16, 16, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Profile',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Outfit',
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: AuthUserStreamWidget(
                  child: ListTile(
                    title: Text(
                      'Name',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    subtitle: Text(
                      valueOrDefault(currentUserDocument?.name, ''),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBtnText,
                    dense: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: AuthUserStreamWidget(
                  child: ListTile(
                    title: Text(
                      'Shipping Address',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    subtitle: Text(
                      valueOrDefault(currentUserDocument?.address, ''),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    tileColor: Colors.white,
                    dense: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: AuthUserStreamWidget(
                  child: ListTile(
                    title: Text(
                      'Phone Number',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    subtitle: Text(
                      valueOrDefault(currentUserDocument?.phoneNumber, ''),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    tileColor: Colors.white,
                    dense: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: ListTile(
                  title: Text(
                    'Email ID',
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                  subtitle: Text(
                    currentUserEmail,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();

                    context.goNamedAuth('Login', mounted);
                  },
                  text: 'Logout',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
