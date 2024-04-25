import 'package:equatable/equatable.dart';

import 'data.dart';

class RatingModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const RatingModel({this.status, this.message, this.data});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  RatingModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return RatingModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
