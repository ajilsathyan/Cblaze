import 'package:cblaze_task/constants/apis.dart';
import 'package:cblaze_task/main.dart';
import 'package:dio/dio.dart';

class ApiServices {
  /// User Logging
  Future<Response> login(Map<String, dynamic> data) async {
    var formData = FormData.fromMap(data);
    return Dio().post(Apis.BASE_URL + Apis.LOGIN,
        data: formData,
        options: Options(headers: {
          'Accept': "application/json",
        }, validateStatus: (_) => true));
  }

  /// Get User Profile Data
  Future<Response> getProfile() async {
    String? token = await storage.read(key: "token");
    return Dio().get(Apis.BASE_URL + Apis.PROFILE,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          'Accept': "application/json",
        }, validateStatus: (_) => true));
  }
}
