import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote {
  Quote({
    required this.id,
    required this.message,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return _$QuoteFromJson(json);
  }

  int id;
  String message;
  String author;

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
