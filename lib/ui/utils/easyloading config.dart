import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black // Blocks user interaction
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..dismissOnTap = false // Prevents dismissing on tap
    ..toastPosition = EasyLoadingToastPosition.bottom;
}