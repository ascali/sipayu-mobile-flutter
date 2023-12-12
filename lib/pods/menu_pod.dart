import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/models/menu_model/data_menu.dart';
import 'package:sipayu/services/home_services.dart';

part 'menu_pod.g.dart';

@Riverpod(keepAlive: true)
class MenuPod extends _$MenuPod {
  @override
  AsyncValue<List<DataMenu>?> build() {
    return const AsyncLoading();
  }

  Future getDataMenu() async {
    final res = await HomeServices.getMenu();
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return;
    }

    state = AsyncValue.data(res.menus);
    log('berhasil get menu');
  }
}
