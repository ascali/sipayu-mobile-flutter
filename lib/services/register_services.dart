import 'package:dio/dio.dart';
import 'package:sipayu/services/dio_service.dart';

class RegisterServices extends DioService {
  Future<bool> register({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? address,
    String? mobileNo,
    String? latitude,
    String? logitude,
  }) async {
    Response res = await dio.post('register', data: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "address": address,
      "mobile_no": mobileNo,
      "latitude": latitude,
      "longitude": logitude,
    });
    return res.statusCode == 201;
  }
}
