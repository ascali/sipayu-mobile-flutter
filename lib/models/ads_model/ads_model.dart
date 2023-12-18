import 'package:equatable/equatable.dart';

import 'ads_data.dart';

class AdsModel extends Equatable {
  final bool? status;
  final String? message;
  final List<AdsData>? data;

  const AdsModel({this.status, this.message, this.data});

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => AdsData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  AdsModel copyWith({
    bool? status,
    String? message,
    List<AdsData>? data,
  }) {
    return AdsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
