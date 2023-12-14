import 'package:dio/dio.dart';
import 'package:sipayu/constants/session_constant.dart';
import 'package:sipayu/services/dio_service.dart';

class LoginService extends DioService {
  Future<bool> login(String email, String password) async {
    Response res = await dio.post('login', data: {
      'email': email,
      'password': password,
    });
    if (res.statusCode == 200) {
      session.write(SessionConstant.id, res.data['data']['user']['id']);
      session.write(SessionConstant.email, res.data['data']['user']['email']);
      session.write(SessionConstant.username, res.data['data']['user']['name']);
      session.write(SessionConstant.token, res.data['data']['access_token']);
      return true;
    }
    return false;
  }

  Future<bool> logOut() async {
    session.remove(SessionConstant.id);
    session.remove(SessionConstant.email);
    session.remove(SessionConstant.username);
    return !session.hasData(SessionConstant.id);
  }
}
