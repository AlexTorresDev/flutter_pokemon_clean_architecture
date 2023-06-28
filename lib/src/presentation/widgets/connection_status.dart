/* import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/connections/network_connectivity.dart';

class ConnectionStatus extends StatefulWidget {
  const ConnectionStatus({
    Key? key,
  }) : super(key: key);

  @override
  State<ConnectionStatus> createState() => _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatus> {
  late NetworkConnectivity _networkConnectivity;

  @override
  void initState() {
    super.initState();
    _networkConnectivity = NetworkConnectivity.instance;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _networkConnectivity.stream,
      initialData: true,
      builder: (_, snapshot) {
        bool isConnected = snapshot.data ?? false;
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isConnected
                ? Theme.of(context).colorScheme.secondary
                : Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(
                isConnected ? Icons.wifi : Icons.wifi_off,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isConnected ? 'Connected' : 'Disconnected',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _networkConnectivity.dispose();
    super.dispose();
  }
}
 */