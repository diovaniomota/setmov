import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding_image_model.dart';
export 'onboarding_image_model.dart';

class OnboardingImageWidget extends StatefulWidget {
  const OnboardingImageWidget({
    super.key,
    required this.img,
  });

  final String? img;

  @override
  State<OnboardingImageWidget> createState() => _OnboardingImageWidgetState();
}

class _OnboardingImageWidgetState extends State<OnboardingImageWidget> {
  late OnboardingImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        widget.img!,
        width: 192.0,
        height: 290.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
