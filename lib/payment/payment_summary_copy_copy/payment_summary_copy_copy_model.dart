import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payment_summary_copy_copy_widget.dart'
    show PaymentSummaryCopyCopyWidget;
import 'package:flutter/material.dart';

class PaymentSummaryCopyCopyModel
    extends FlutterFlowModel<PaymentSummaryCopyCopyWidget> {
  ///  Local state fields for this page.

  String? valor;

  String? tax;

  String? numeroAleatorio;

  int? valorint;

  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WalletsRow>? walletExiste;
  // Stores action output result for [Backend Call - API (checkoutPagamentoStripe)] action in Button widget.
  ApiCallResponse? linkCheckout;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PaymentConfirmationRow>? statusPagamentoWallet;
  // Stores action output result for [Backend Call - API (checkoutPagamentoStripe)] action in Button widget.
  ApiCallResponse? linkCheckoutWallet;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PaymentConfirmationRow>? statusPagamento;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
