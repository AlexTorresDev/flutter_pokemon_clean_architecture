import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();

  static NetworkConnectivity get instance => _instance;

  final _connectivity = Connectivity();

  final _controller = StreamController<bool>.broadcast();

  Stream<bool> get stream => _controller.stream;

  bool _hasConnection = false;

  void init() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged
        .listen((result) => _checkStatus(result));
  }

  void _checkStatus(ConnectivityResult result) async {
    bool previousConnectionStatus = _hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      _hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      _hasConnection = false;
    }

    if (previousConnectionStatus != _hasConnection) {
      _controller.sink.add(_hasConnection);
    }
  }

  void dispose() => _controller.close();
}
