import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'fade_in_animation_controller.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation({
    super.key,
    required this.durationInSc,
    this.animate,
    required this.child,
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInSc;
  final FadeInAnimationPosition? animate;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
          duration: Duration(seconds: durationInSc),
          top:
              controller.animate.value ? animate!.topAfter : animate!.topBefore,
          left: controller.animate.value
              ? animate!.leftAfter
              : animate!.leftBefore,
          bottom: controller.animate.value
              ? animate!.bottomAfter
              : animate!.bottomBefore,
          right: controller.animate.value
              ? animate!.rightAfter
              : animate!.rightBefore,
          child: AnimatedOpacity(
            opacity: controller.animate.value ? 1 : 0,
            duration: Duration(seconds: durationInSc),
            child: child,
          )),
    );
  }
}