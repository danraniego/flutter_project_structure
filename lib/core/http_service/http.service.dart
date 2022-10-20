import 'dart:convert';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:mvc/core/storage/local_storage.dart';
import '../components/toaster.dart';
import 'api_response.model.dart';
import 'file.model.ts.dart';

class HttpService {
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "Content-type": "application/json"
  };
  static const String errorUndefined = "Something went wrong. Please try again.";

  final String _apiUrl = dotenv.env['API_URL'] ?? '';

  HttpService();

  // Return Error
  errorRequest(e) {
    Toaster.error(e.toString());
    return ApiResponse(
        success: false,
        message: e.toString(),
        data: {}
    );
  }

  // Validate response
  validateResponse(http.Response response) {
    Map body = json.decode(response.body);

    ApiResponse apiResponse = ApiResponse(
        success: false,
        message: body["message"] ?? "",
        data: body["data"]
    );

    if (response.statusCode != 200 &&
        response.statusCode != 202 &&
        response.statusCode != 201) {

      if (body["message"] != null) {
        Toaster.error(body["message"]);
      }
      return apiResponse;
    } else {
      apiResponse.success = true;
      return apiResponse;
    }
  }

  setTokenHeader() async {
    String? token = await LocalStorage.getToken();
    if (token != null) {
      _headers["Authorization"] = "Bearer $token";
    }
  }

  /// HTTP POST
  Future<ApiResponse> post(String uri, Map body) {
    setTokenHeader();

    return http
        .post(Uri.parse(_apiUrl + uri), body: json.encode(body), headers: _headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// HTTP PUT
  Future<ApiResponse> put(String uri, Map parameters) async {
    return http
        .put(Uri.parse(_apiUrl + uri), body: json.encode(parameters), headers: _headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// HTTP PATCH
  Future<ApiResponse> patch(String uri, Map parameters) async {
    setTokenHeader();
    return http
        .patch(Uri.parse(_apiUrl + uri),
        body: json.encode(parameters), headers: _headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// HTTP GET
  Future<ApiResponse> get(String uri, Map parameters, [bool thirdParty = false]) async {
    setTokenHeader();
    if (parameters.isNotEmpty) {
      var length = parameters.keys.length;
      var counter = 1;

      uri += "?";
      for (var key in parameters.keys) {
        uri += key + "=" + parameters[key].toString();
        if (counter < length) {
          uri += "&";
        }
        counter++;
      }
    }

    var url = (!thirdParty) ? _apiUrl + uri : uri;

    return http.get(Uri.parse(url), headers: _headers).then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// HTTP DELETE
  Future<ApiResponse> delete(String uri, Map parameters) async {
    setTokenHeader();
    return http
        .delete(Uri.parse(_apiUrl + uri), body: json.encode(parameters), headers: _headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// HTTP Upload Single File
  Future<ApiResponse> upload(String uri, Map body, File file, String paramName) async {
    setTokenHeader();

    var parsedUri = Uri.parse(_apiUrl + uri);
    var request = http.MultipartRequest("POST", parsedUri);

    _headers.addAll({
      "Content-type": "multipart/form-data",
    });

    request.headers.addAll(_headers);

    for (var key in body.keys) {
      request.fields[key] = body[key].toString();
    }

    request.files.add(
      http.MultipartFile.fromBytes(
        paramName,
        await file.readAsBytes(),
        filename: basename(file.path),
        contentType: MediaType.parse(lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])!,
        ),
      ),
    );

    return request.send().then((result) {
      return http.Response.fromStream(result).then((response) {
        return validateResponse(response);
      }, onError: (e) {
        return errorRequest(e);
      });
    });
  }

  /// HTTP Upload Multiple Files
  Future<ApiResponse> uploadMultiple(String uri, Map body, List<FileModel> files) async {
    setTokenHeader();

    var parsedUri = Uri.parse(_apiUrl + uri);
    var request = http.MultipartRequest("POST", parsedUri);

    _headers.addAll({
      "Content-type": "multipart/form-data",
    });

    request.headers.addAll(_headers);

    for (var key in body.keys) {
      request.fields[key] = body[key].toString();
    }

    for (var file in files) {
      request.files.add(
        http.MultipartFile.fromBytes(
          file.name,
          await file.file.readAsBytes(),
          filename: basename(file.file.path),
          contentType: MediaType.parse(lookupMimeType(file.file.path, headerBytes: [0xFF, 0xD8])!,
          ),
        ),
      );
    }

    return request.send().then((result) {
      return http.Response.fromStream(result).then((response) {
        return validateResponse(response);
      }, onError: (e) {
        return errorRequest(e);
      });
    });
  }
}