import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsModificaProductoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TxtNombreProducto widget.
  TextEditingController? txtNombreProductoController;
  String? Function(BuildContext, String?)? txtNombreProductoControllerValidator;
  // State field(s) for TxtPrecioProducto widget.
  TextEditingController? txtPrecioProductoController;
  String? Function(BuildContext, String?)? txtPrecioProductoControllerValidator;
  // State field(s) for TxtCantidadProducto widget.
  TextEditingController? txtCantidadProductoController;
  String? Function(BuildContext, String?)?
      txtCantidadProductoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtNombreProductoController?.dispose();
    txtPrecioProductoController?.dispose();
    txtCantidadProductoController?.dispose();
  }

  /// Additional helper methods are added here.

}
