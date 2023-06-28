/* import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkConnectivity {
  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();

  static NetworkConnectivity get instance => _instance;

  final _connectivity = Connectivity();

  final _controller = StreamController<bool>.broadcast();

  Stream<bool> get stream => _controller.stream;

  bool _hasConnection = false;

  void init() async {
    _checkStatus();
    _connectivity.onConnectivityChanged.listen((_) => _checkStatus());
  }

  void _checkStatus() async {
    bool previousConnectionStatus = _hasConnection;

    try {
      ConnectivityResult result = await _connectivity.checkConnectivity();
      _hasConnection = result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      _hasConnection = false;
    }

    if (previousConnectionStatus != _hasConnection) {
      _controller.sink.add(_hasConnection);
    }
  }

  void dispose() => _controller.close();
} */
