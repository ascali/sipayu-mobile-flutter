import 'package:equatable/equatable.dart';

class DataMenu extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  const DataMenu({
    this.id,
    this.name,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DataMenu.fromJson(Map<String, dynamic> json) => DataMenu(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
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
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  DataMenu copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) {
    return DataMenu(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
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
      createdAt,
      updatedAt,
      deletedAt,
    ];
  }
}
