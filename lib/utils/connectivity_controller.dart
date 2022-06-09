import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:comic_tech/widgets/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Controller network state
class ConnectivityController extends GetxController {
  /// Constructor
  ConnectivityController() {
    _initConnectivity();
    _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  static bool _connection = true;
  final Connectivity _connectivity = Connectivity();

  Future<void> _initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      _reloadAndSendData();
      _connection = true;
      return;
    }
    _connection = false;
  }

  Future<void> _reloadAndSendData() async {
    if (Get.find<AllComicsController>().state!.isEmpty) {
      await Get.find<AllComicsController>().getAllComics();
    }
  }

  /// Validate to network state
  bool validateConnection({
    BuildContext? context,
  }) {
    if (_connection) {
      return true;
    }
    if (context != null) {
      Get.showSnackbar(
        customSnackBar(
          context: context,
          isConnectionMessage: true,
          message: 'Please check your internet connection and try again later.',
        ),
      );
      return false;
    }
    return false;
  }
}
