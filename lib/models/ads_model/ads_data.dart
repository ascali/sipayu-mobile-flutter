import 'package:equatable/equatable.dart';

class AdsData extends Equatable {
  final int? id;
  final String? name;
  final dynamic type;
  final String? image;
  final String? url;
  final String? description;
  final String? efective;
  final String? expired;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  const AdsData({
    this.id,
    this.name,
    this.type,
    this.image,
    this.url,
    this.description,
    this.efective,
    this.expired,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory AdsData.fromJson(Map<String, dynamic> json) => AdsData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        type: json['type'] as dynamic,
        image: json['image'] as String?,
        url: json['url'] as String?,
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
        'type': type,
        'image': image,
        'url': url,
        'description': description,
        'efective': efective,
        'expired': expired,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  AdsData copyWith({
    int? id,
    String? name,
    dynamic type,
    String? image,
    String? url,
    String? description,
    String? efective,
    String? expired,
    String? latitude,
    String? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) {
    return AdsData(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      image: image ?? this.image,
      url: url ?? this.url,
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
      type,
      image,
      url,
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
