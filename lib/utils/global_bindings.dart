import 'package:get/get.dart';
import 'utils.dart';

/// Init global controllers
class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityController>(
      ConnectivityController(),
    );
  }
}
