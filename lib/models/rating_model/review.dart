import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int? id;
  final int? idUser;
  final int? idDestination;
  final int? idRating;
  final dynamic idReviewImage;
  final String? review;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? idRole;
  final String? name;
  final String? email;
  final String? password;
  final dynamic mobileNo;
  final dynamic address;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic rememberToken;

  const Review({
    this.id,
    this.idUser,
    this.idDestination,
    this.idRating,
    this.idReviewImage,
    this.review,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.idRole,
    this.name,
    this.email,
    this.password,
    this.mobileNo,
    this.address,
    this.latitude,
    this.longitude,
    this.rememberToken,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int?,
        idUser: json['id_user'] as int?,
        idDestination: json['id_destination'] as int?,
        idRating: json['id_rating'] as int?,
        idReviewImage: json['id_review_image'] as dynamic,
        review: json['review'] as String?,
        image: json['image'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
        idRole: json['id_role'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        mobileNo: json['mobile_no'] as dynamic,
        address: json['address'] as dynamic,
        latitude: json['latitude'] as dynamic,
        longitude: json['longitude'] as dynamic,
        rememberToken: json['remember_token'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': idUser,
        'id_destination': idDestination,
        'id_rating': idRating,
        'id_review_image': idReviewImage,
        'review': review,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'id_role': idRole,
        'name': name,
        'email': email,
        'password': password,
        'mobile_no': mobileNo,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'remember_token': rememberToken,
      };

  Review copyWith({
    int? id,
    int? idUser,
    int? idDestination,
    int? idRating,
    dynamic idReviewImage,
    String? review,
    dynamic image,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? idRole,
    String? name,
    String? email,
    String? password,
    dynamic mobileNo,
    dynamic address,
    dynamic latitude,
    dynamic longitude,
    dynamic rememberToken,
  }) {
    return Review(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idDestination: idDestination ?? this.idDestination,
      idRating: idRating ?? this.idRating,
      idReviewImage: idReviewImage ?? this.idReviewImage,
      review: review ?? this.review,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      idRole: idRole ?? this.idRole,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mobileNo: mobileNo ?? this.mobileNo,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rememberToken: rememberToken ?? this.rememberToken,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      idUser,
      idDestination,
      idRating,
      idReviewImage,
      review,
      image,
      createdAt,
      updatedAt,
      deletedAt,
      idRole,
      name,
      email,
      password,
      mobileNo,
      address,
      latitude,
      longitude,
      rememberToken,
    ];
  }
}
