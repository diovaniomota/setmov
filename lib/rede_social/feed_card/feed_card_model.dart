import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_card_widget.dart' show FeedCardWidget;
import 'package:flutter/material.dart';

class FeedCardModel extends FlutterFlowModel<FeedCardWidget> {
  ///  Local state fields for this component.

  bool liked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in FeedCard widget.
  List<CommentLikesRow>? query;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
