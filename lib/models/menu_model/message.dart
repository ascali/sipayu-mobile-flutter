import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String? title;
  final String? body;

  const Message({this.title, this.body});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };

  Message copyWith({
    String? title,
    String? body,
  }) {
    return Message(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object?> get props => [title, body];
}
