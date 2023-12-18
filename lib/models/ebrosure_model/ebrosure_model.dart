import 'package:equatable/equatable.dart';

import 'e_brosure_data.dart';

class EbrosureModel extends Equatable {
  final bool? status;
  final String? message;
  final List<EBrosureData>? data;

  const EbrosureModel({this.status, this.message, this.data});

  factory EbrosureModel.fromJson(Map<String, dynamic> json) => EbrosureModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => EBrosureData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  EbrosureModel copyWith({
    bool? status,
    String? message,
    List<EBrosureData>? data,
  }) {
    return EbrosureModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
