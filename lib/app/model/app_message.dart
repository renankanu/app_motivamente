class AppMessage {
  factory AppMessage.fromJson(Map<String, dynamic> json) => AppMessage(
        message: json['message'] as String,
        author: json['author'] as String,
      );

  AppMessage({
    required this.message,
    required this.author,
  });

  final String message;
  final String author;
}
