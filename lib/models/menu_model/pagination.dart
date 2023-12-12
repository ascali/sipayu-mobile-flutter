import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int? currentPage;
  final int? currentElements;
  final int? totalPages;
  final int? totalElements;
  final List<dynamic>? sortBy;

  const Pagination({
    this.currentPage,
    this.currentElements,
    this.totalPages,
    this.totalElements,
    this.sortBy,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json['currentPage'] as int?,
        currentElements: json['currentElements'] as int?,
        totalPages: json['totalPages'] as int?,
        totalElements: json['totalElements'] as int?,
        sortBy: json['sortBy'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'currentElements': currentElements,
        'totalPages': totalPages,
        'totalElements': totalElements,
        'sortBy': sortBy,
      };

  Pagination copyWith({
    int? currentPage,
    int? currentElements,
    int? totalPages,
    int? totalElements,
    List<dynamic>? sortBy,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      currentElements: currentElements ?? this.currentElements,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  @override
  List<Object?> get props {
    return [
      currentPage,
      currentElements,
      totalPages,
      totalElements,
      sortBy,
    ];
  }
}
