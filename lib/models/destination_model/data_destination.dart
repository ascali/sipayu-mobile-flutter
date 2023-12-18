import 'package:equatable/equatable.dart';

class DataDestination extends Equatable {
  final int? id;
  final int? idToi;
  final String? name;
  final String? image;
  final String? contact;
  final String? description;
  final String? location;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final num? rating;
  final num? review;

  const DataDestination({
    this.id,
    this.idToi,
    this.name,
    this.image,
    this.contact,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.rating,
    this.review,
  });

  factory DataDestination.fromJson(Map<String, dynamic> json) =>
      DataDestination(
        id: json['id'] as int?,
        idToi: json['id_toi'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        contact: json['contact'] as String?,
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
        rating: json['rating'] as num?,
        review: json['review'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_toi': idToi,
        'name': name,
        'image': image,
        'contact': contact,
        'description': description,
        'location': location,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'rating': rating,
        'review': review,
      };

  DataDestination copyWith({
    int? id,
    int? idToi,
    String? name,
    String? image,
    String? contact,
    String? description,
    String? location,
    String? latitude,
    String? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    num? rating,
    num? review,
  }) {
    return DataDestination(
      id: id ?? this.id,
      idToi: idToi ?? this.idToi,
      name: name ?? this.name,
      image: image ?? this.image,
      contact: contact ?? this.contact,
      description: description ?? this.description,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rating: rating ?? this.rating,
      review: review ?? this.review,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      idToi,
      name,
      image,
      contact,
      description,
      location,
      latitude,
      longitude,
      createdAt,
      updatedAt,
      deletedAt,
      rating,
      review,
    ];
  }
}
