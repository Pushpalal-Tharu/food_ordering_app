import 'package:food_ordering_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late Map<String, String> _mainHeaders;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    // token = "";
    _mainHeaders = {
      // 'Content-type': 'application/json; charset=UTF-8',
      // "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      // 'Content-type': 'application/json; charset=UTF-8',
      // "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String Uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(Uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String Uri, dynamic body) async {
    try {
      Response response = await post(Uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
