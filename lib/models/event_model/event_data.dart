import 'package:equatable/equatable.dart';

class EventData extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? dateEvent;
  final String? description;
  final String? location;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  const EventData({
    this.id,
    this.name,
    this.image,
    this.dateEvent,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        dateEvent: json['date_event'] as String?,
        description: json['description'] as String?,
        location: json['location'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'date_event': dateEvent,
        'description': description,
        'location': location,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  EventData copyWith({
    int? id,
    String? name,
    String? image,
    String? dateEvent,
    String? description,
    String? location,
    String? latitude,
    String? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) {
    return EventData(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      dateEvent: dateEvent ?? this.dateEvent,
      description: description ?? this.description,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      dateEvent,
      description,
      location,
      latitude,
      longitude,
      createdAt,
      updatedAt,
      deletedAt,
    ];
  }
}
