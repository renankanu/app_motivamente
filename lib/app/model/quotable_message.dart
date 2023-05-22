import 'package:json_annotation/json_annotation.dart';

part 'quotable_message.g.dart';

@JsonSerializable()
class QuotableMessage {
  QuotableMessage({
    this.id,
    this.content,
    this.author,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  factory QuotableMessage.fromJson(Map<String, dynamic> json) {
    return _$QuotableMessageFromJson(json);
  }

  @JsonKey(name: '_id')
  String? id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Map<String, dynamic> toJson() => _$QuotableMessageToJson(this);
}
