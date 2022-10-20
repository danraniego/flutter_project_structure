import 'package:mvc/core/http_service/http.service.dart';

class AuthService extends HttpService {

  authenticate(Map body) async {
    return await super.post('/login', body);
  }
}