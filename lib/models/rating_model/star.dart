import 'package:equatable/equatable.dart';

class Star extends Equatable {
  final int? star5;
  final int? star4;
  final int? star3;
  final int? star2;
  final int? star1;

  const Star({this.star5, this.star4, this.star3, this.star2, this.star1});

  factory Star.fromJson(Map<String, dynamic> json) => Star(
        star5: json['star_5'] as int?,
        star4: json['star_4'] as int?,
        star3: json['star_3'] as int?,
        star2: json['star_2'] as int?,
        star1: json['star_1'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'star_5': star5,
        'star_4': star4,
        'star_3': star3,
        'star_2': star2,
        'star_1': star1,
      };

  Star copyWith({
    int? star5,
    int? star4,
    int? star3,
    int? star2,
    int? star1,
  }) {
    return Star(
      star5: star5 ?? this.star5,
      star4: star4 ?? this.star4,
      star3: star3 ?? this.star3,
      star2: star2 ?? this.star2,
      star1: star1 ?? this.star1,
    );
  }

  @override
  List<Object?> get props => [star5, star4, star3, star2, star1];
}
