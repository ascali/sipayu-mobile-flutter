import 'package:equatable/equatable.dart';

import 'event_data.dart';

class EventModel extends Equatable {
  final bool? status;
  final String? message;
  final List<EventData>? data;

  const EventModel({this.status, this.message, this.data});

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => EventData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  EventModel copyWith({
    bool? status,
    String? message,
    List<EventData>? data,
  }) {
    return EventModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
