import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/models/ads_model/ads_data.dart';
import 'package:sipayu/models/event_model/event_data.dart';
import 'package:sipayu/services/home_services.dart';

part 'event_pod.g.dart';

@Riverpod(keepAlive: false)
class EventPod extends _$EventPod {
  final homeSevices = HomeServices();
  @override
  AsyncValue<List<EventData>?> build() {
    return const AsyncLoading();
  }

  Future getEvent(String month, String year) async {
    final res = await homeSevices.getEvent(month, year);
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return;
    }
    state = AsyncValue.data(res.events);
  }
}
