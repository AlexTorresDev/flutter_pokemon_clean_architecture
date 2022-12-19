import 'package:http/http.dart' show Client, Response;

class ClientService {
  ClientService();

  final Client client = Client();

  Future<Response> get(String? url) async {
    return await client.get(Uri.parse(url ?? ''));
  }
}
