import 'package:equatable/equatable.dart';

import 'data_menu.dart';
import 'message.dart';
import 'pagination.dart';

class MenuModel extends Equatable {
  final Message? message;
  final List<DataMenu>? data;
  final Pagination? pagination;

  const MenuModel({this.message, this.data, this.pagination});

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        message: json['message'] == null
            ? null
            : Message.fromJson(json['message'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataMenu.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson(),
      };

  MenuModel copyWith({
    Message? message,
    List<DataMenu>? data,
    Pagination? pagination,
  }) {
    return MenuModel(
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object?> get props => [message, data, pagination];
}
