import 'package:equatable/equatable.dart';

class EBrosureData extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final String? efective;
  final String? expired;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  const EBrosureData({
    this.id,
    this.name,
    this.image,
    this.description,
    this.efective,
    this.expired,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory EBrosureData.fromJson(Map<String, dynamic> json) => EBrosureData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        efective: json['efective'] as String?,
        expired: json['expired'] as String?,
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
        'description': description,
        'efective': efective,
        'expired': expired,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  EBrosureData copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    String? efective,
    String? expired,
    String? latitude,
    String? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) {
    return EBrosureData(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      efective: efective ?? this.efective,
      expired: expired ?? this.expired,
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
      description,
      efective,
      expired,
      latitude,
      longitude,
      createdAt,
      updatedAt,
      deletedAt,
    ];
  }
}
