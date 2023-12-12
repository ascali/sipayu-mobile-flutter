import 'package:equatable/equatable.dart';

class DataMenu extends Equatable {
  final String? title;
  final String? type;
  final String? icons;
  final String? link;

  const DataMenu({this.title, this.type, this.icons, this.link});

  factory DataMenu.fromJson(Map<String, dynamic> json) => DataMenu(
        title: json['title'] as String?,
        type: json['type'] as String?,
        icons: json['icons'] as String?,
        link: json['link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
        'icons': icons,
        'link': link,
      };

  DataMenu copyWith({
    String? title,
    String? type,
    String? icons,
    String? link,
  }) {
    return DataMenu(
      title: title ?? this.title,
      type: type ?? this.type,
      icons: icons ?? this.icons,
      link: link ?? this.link,
    );
  }

  @override
  List<Object?> get props => [title, type, icons, link];
}
