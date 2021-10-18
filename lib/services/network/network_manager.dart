import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_get/shared/shared.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  //this variable NONE = No Internet, CONNECT_TO_WIFI = connected to WIFI ,CONNECT_TO_MOBIE = connected to Mobile Data.
  var connectionType = Network.NONE;
  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  //Stream to keep listening to network change state
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    initConnectionType();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    super.onInit();
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> initConnectionType() async {
    late ConnectivityResult result;
    try {
      result = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      log('$e');
      return;
    }
    return _updateConnectionStatus(result);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateConnectionStatus(ConnectivityResult result) {
    log('$result');
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = Network.CONNECT_TO_WIFI;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType = Network.CONNECT_TO_MOBILE;
        update();
        break;
      case ConnectivityResult.none:
        connectionType = Network.NONE;
        update();
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _connectivitySubscription.cancel();
  }
}
