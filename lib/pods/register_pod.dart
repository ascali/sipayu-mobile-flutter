import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/constants/enum.dart';
import 'package:sipayu/pages/widgets/loading_builder.dart';
import 'package:sipayu/pages/widgets/show_snackbar.dart';
import 'package:sipayu/services/register_services.dart';

part 'register_pod.g.dart';

@riverpod
class RegisterPod extends _$RegisterPod {
  final registerService = RegisterServices();
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  Future regsiter({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? address,
    String? mobileNo,
    String? latitude,
    String? logitude,
  }) async {
    if (name?.isEmpty == true ||
        email?.isEmpty == true ||
        password?.isEmpty == true ||
        address?.isEmpty == true ||
        mobileNo?.isEmpty == true ||
        mobileNo?.isEmpty == true) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          title: 'Register',
          message: 'Data Tidak boleh Kosong');
      return;
    }
    if (password != passwordConfirmation) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          title: 'Login',
          message: 'Password harus sama');
      return;
    }
    loadingBuilder();
    final res = await registerService.register(
      name: name,
      password: password,
      passwordConfirmation: passwordConfirmation,
      email: email,
      mobileNo: mobileNo,
      address: address,
      latitude: latitude,
      logitude: logitude,
    );

    Get.back();
    if (res) {
      Get.back();
      showSnackBar(
          snackBarType: SnackBarType.success,
          title: 'Register',
          message: 'Register Berhasil');

      return;
    }
    showSnackBar(
        snackBarType: SnackBarType.error,
        title: 'Register',
        message: 'Register Gagal Coba lagi nanti');
    return;
  }
}
