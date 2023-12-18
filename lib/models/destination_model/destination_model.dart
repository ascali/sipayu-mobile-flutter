import 'package:equatable/equatable.dart';

import 'data_destination.dart';

class DestinationModel extends Equatable {
  final bool? status;
  final String? message;
  final List<DataDestination>? data;

  const DestinationModel({this.status, this.message, this.data});

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  DestinationModel copyWith({
    bool? status,
    String? message,
    List<DataDestination>? data,
  }) {
    return DestinationModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
