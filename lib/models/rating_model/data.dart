import 'package:equatable/equatable.dart';

import 'rating.dart';
import 'review.dart';
import 'star.dart';

class Data extends Equatable {
  final List<Rating>? rating;
  final List<Star>? stars;
  final List<Review>? reviews;

  const Data({this.rating, this.stars, this.reviews});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rating: (json['rating'] as List<dynamic>?)
            ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
            .toList(),
        stars: (json['stars'] as List<dynamic>?)
            ?.map((e) => Star.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'rating': rating?.map((e) => e.toJson()).toList(),
        'stars': stars?.map((e) => e.toJson()).toList(),
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };

  Data copyWith({
    List<Rating>? rating,
    List<Star>? stars,
    List<Review>? reviews,
  }) {
    return Data(
      rating: rating ?? this.rating,
      stars: stars ?? this.stars,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object?> get props => [rating, stars, reviews];
}
