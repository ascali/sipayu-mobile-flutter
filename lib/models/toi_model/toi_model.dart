import 'package:equatable/equatable.dart';

import 'data_menu.dart';

class ToiModel extends Equatable {
  final bool? status;
  final String? message;
  final List<DataMenu>? data;

  const ToiModel({this.status, this.message, this.data});

  factory ToiModel.fromJson(Map<String, dynamic> json) => ToiModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataMenu.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  ToiModel copyWith({
    bool? status,
    String? message,
    List<DataMenu>? data,
  }) {
    return ToiModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
