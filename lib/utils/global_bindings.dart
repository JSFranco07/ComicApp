import 'package:get/get.dart';
import 'utils.dart';

/// Inicializa los controladores de manera global
class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityController>(
      ConnectivityController(),
    );
  }
}
