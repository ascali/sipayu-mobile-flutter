import 'package:sipayu/models/ads_model/ads_data.dart';
import 'package:sipayu/models/ads_model/ads_model.dart';
import 'package:sipayu/models/destination_model/data_destination.dart';
import 'package:sipayu/models/destination_model/destination_model.dart';
import 'package:sipayu/models/ebrosure_model/e_brosure_data.dart';
import 'package:sipayu/models/ebrosure_model/ebrosure_model.dart';
import 'package:sipayu/models/event_model/event_data.dart';
import 'package:sipayu/models/event_model/event_model.dart';
import 'package:sipayu/models/rating_model/rating_model.dart';
import 'package:sipayu/models/toi_model/data_menu.dart';
import 'package:sipayu/models/toi_model/toi_model.dart';
import 'package:sipayu/services/dio_service.dart';

class HomeServices extends DioService {
  Future<({List<DataMenu>? menus, String? error})> getMenu() async {
    var data = await dio.get('type_of_interest');

    ToiModel toiModel = ToiModel.fromJson(data.data);
    return (
      menus: toiModel.data,
      error: null,
    );
  }

  Future<({List<AdsData>? ads, String? error})> getAds() async {
    var data = await dio.get('ads', queryParameters: {'limit': 5, 'page': 1});

    AdsModel adsModel = AdsModel.fromJson(data.data);
    return (
      ads: adsModel.data,
      error: null,
    );
  }

  Future<({List<EBrosureData>? brosure, String? error})> getBrosure() async {
    var data =
        await dio.get('ebrosure', queryParameters: {'limit': 5, 'page': 1});

    EbrosureModel ebrosureModel = EbrosureModel.fromJson(data.data);
    return (
      brosure: ebrosureModel.data,
      error: null,
    );
  }

  Future<({List<DataDestination>? destinations, String? error})> getDestiantion(
      String id,
      {int? page}) async {
    var data = await dio.get('destination/list', queryParameters: {
      'limit': 10,
      'page': page ?? 1,
      'id_toi': id,
    });

    DestinationModel destinationModel = DestinationModel.fromJson(data.data);
    return (
      destinations: destinationModel.data,
      error: null,
    );
  }

  Future<({List<EventData>? events, String? error})> getEvent(
      String month, String year) async {
    var data = await dio.get('event', queryParameters: {
      'month': month,
      'year': year,
    });

    EventModel eventModel = EventModel.fromJson(data.data);
    return (
      events: eventModel.data,
      error: null,
    );
  }

  Future<({String? error})> createRating({
    required String userId,
    required String idDestination,
    required double rating,
    required String title,
    required String review,
  }) async {
    var data = await dio.post('review/create', data: {
      "id_user": userId,
      "id_destination": idDestination,
      "rating": rating,
      "image": "",
      "review": review,
      "title": title,
    });

    return (error: null,);
  }

  Future<({RatingModel? ratingModel, String? error})> getReview(
      String idDestination) async {
    var data = await dio.get('review/list', queryParameters: {
      'id_destination': idDestination,
      'limit': 100,
      'page': 1,
    });

    RatingModel ratingModel = RatingModel.fromJson(data.data);
    return (
      ratingModel: ratingModel,
      error: null,
    );
  }
}
