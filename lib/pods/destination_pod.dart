import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipayu/constants/enum.dart';

import 'package:sipayu/models/ads_model/ads_data.dart';
import 'package:sipayu/models/destination_model/data_destination.dart';
import 'package:sipayu/models/rating_model/rating_model.dart';
import 'package:sipayu/pages/widgets/loading_builder.dart';
import 'package:sipayu/pages/widgets/show_snackbar.dart';
import 'package:sipayu/services/home_services.dart';

part 'destination_pod.g.dart';

@Riverpod(keepAlive: true)
class DestinationPod extends _$DestinationPod {
  final homeSevices = HomeServices();
  @override
  AsyncValue<List<DestinationViewModel>?> build() {
    return const AsyncLoading();
  }

  Future getDestination(String id) async {
    final res = await homeSevices.getDestiantion(id);
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return;
    }

    List<DestinationViewModel> list = [];
    // if (state.value?.isEmpty == true) {
    list.add(
        DestinationViewModel(id: id, destinations: res.destinations ?? []));
    // }
    for (var element in state.value ?? []) {
      if (element.id == id) {
        list.add(element.copyWith(destinations: res.destinations ?? []));
      }
      list.add(element);
    }
    state = AsyncValue.data(list);
  }

  Future<bool> getDestinationOnloading(String id, {int? page}) async {
    final res = await homeSevices.getDestiantion(id, page: page);
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return false;
    }

    List<DataDestination>? list = state.value?.first.destinations;

    list?.addAll(res.destinations ?? []);

    List<DestinationViewModel> destination = [];
    destination.add(DestinationViewModel(id: id, destinations: list ?? []));
    state = AsyncValue.data(destination);
    return true;
  }

  Future createRating(
      {required String userId,
      required String idDestination,
      required double rating,
      String? title,
      String? review}) async {
    if (title == null || review == null) {
      showSnackBar(
          snackBarType: SnackBarType.info,
          message: 'Form Tidak boleh Kosong',
          title: 'Review');
      return;
    }
    loadingBuilder();
    await homeSevices.createRating(
        userId: userId,
        idDestination: idDestination,
        rating: rating,
        review: review,
        title: title);
    Get.back();
    Get.back();
    showSnackBar(
        snackBarType: SnackBarType.info,
        message: 'Berhasil Dirating',
        title: 'Review');
  }

  Future<RatingModel?> getReview(String id) async {
    loadingBuilder();
    final res = await homeSevices.getReview(id);
    Get.back();
    if (res.error != null) {
      state = AsyncError(res.error ?? '', StackTrace.current);
      return null;
    }

    return res.ratingModel;
  }
}

class DestinationViewModel extends Equatable {
  final String id;
  final List<DataDestination> destinations;
  final bool isLoading;
  const DestinationViewModel({
    required this.id,
    required this.destinations,
    this.isLoading = true,
  });

  DestinationViewModel copyWith({
    String? id,
    List<DataDestination>? destinations,
    bool? isLoading,
  }) {
    return DestinationViewModel(
      id: id ?? this.id,
      destinations: destinations ?? this.destinations,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [id, destinations, isLoading];
}
