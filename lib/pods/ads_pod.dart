import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/models/ads_model/ads_data.dart';
import 'package:sipayu/services/home_services.dart';

part 'ads_pod.g.dart';

@Riverpod(keepAlive: true)
class AdsPod extends _$AdsPod {
  final homeSevices = HomeServices();
  @override
  AsyncValue<List<AdsData>?> build() {
    return const AsyncLoading();
  }

  Future getDataAds() async {
    final res = await homeSevices.getAds();
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return;
    }
    state = AsyncValue.data(res.ads);
  }
}
