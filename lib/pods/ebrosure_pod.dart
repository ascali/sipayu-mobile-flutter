import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/models/ads_model/ads_data.dart';
import 'package:sipayu/models/ebrosure_model/e_brosure_data.dart';
import 'package:sipayu/services/home_services.dart';

part 'ebrosure_pod.g.dart';

@Riverpod(keepAlive: true)
class EBrosurePod extends _$EBrosurePod {
  final homeSevices = HomeServices();
  @override
  AsyncValue<List<EBrosureData>?> build() {
    return const AsyncLoading();
  }

  Future getBrosure() async {
    final res = await homeSevices.getBrosure();
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return;
    }
    state = AsyncValue.data(res.brosure);
  }
}
