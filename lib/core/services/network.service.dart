import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkService {

  /// Check Internet Connectivity
  static  Future<bool> checkInternet() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup(dotenv.env['API_URL'] ?? 'google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }
}