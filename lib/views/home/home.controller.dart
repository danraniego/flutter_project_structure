import 'package:flutter/cupertino.dart';
import 'package:mvc/core/components/dialog/progress_dialog.dart';
import 'package:mvc/core/models/api_response.model.dart';
import '../../data/services/auth.service.dart';

class HomeController {

  late AuthService authService;

  String text = 'Hello World!';


  HomeController() {
    authService = AuthService();
  }

  post() async {
    Map body = {
      "username": '',
      "password": ''
    };

    ApiResponse response = await authService.authenticate(body);
  }

  showSpinner(BuildContext context) {
    ProgressDialog.spin(context, 'Testing...');
  }

  hideSpinner(BuildContext context) {
    ProgressDialog.stop(context);
  }
}