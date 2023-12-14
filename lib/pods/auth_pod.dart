import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/constants/enum.dart';
import 'package:sipayu/pages/login_screen.dart';
import 'package:sipayu/pages/main_screen.dart';
import 'package:sipayu/pages/widgets/loading_builder.dart';
import 'package:sipayu/pages/widgets/show_snackbar.dart';
import 'package:sipayu/services/home_services.dart';
import 'package:sipayu/services/login_services.dart';

part 'auth_pod.g.dart';

@Riverpod(keepAlive: true)
class AuthPod extends _$AuthPod {
  final LoginService loginService = LoginService();
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  Future login(String? email, String? password) async {
    if (email?.isEmpty == true || password?.isEmpty == true) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          title: 'Login',
          message: 'Email or password tidak boleh Kosong');
      return;
    }

    loadingBuilder();
    final res = await loginService.login(email!, password!);
    if (res) {
      Get.offAll(const MainScreen());
      return;
    }
    showSnackBar(
        snackBarType: SnackBarType.error,
        title: 'Login',
        message: 'Email or password Salah');
    return;
  }

  Future logout() async {
    loginService.logOut();
    Get.offAll(const LoginScreen());
  }
}
