import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final String? rating;

  const Rating({this.rating});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json['rating'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
      };

  Rating copyWith({
    String? rating,
  }) {
    return Rating(
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [rating];
}
