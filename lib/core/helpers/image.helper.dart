import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageHelper {

  /// Check Image Link if valid
  static checkImage(String? imageLink) {
    if (imageLink == null || imageLink == "") {
      return "";
    }
    return imageLink.contains('http')
        ? imageLink : dotenv.env['API_URL'].toString() + imageLink;
  }
}