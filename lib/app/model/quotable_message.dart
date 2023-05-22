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

  QuotableMessage copyWith({
    String? id,
    String? content,
    String? author,
    List<String>? tags,
    String? authorSlug,
    int? length,
    String? dateAdded,
    String? dateModified,
  }) {
    return QuotableMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      author: author ?? this.author,
      tags: tags ?? this.tags,
      authorSlug: authorSlug ?? this.authorSlug,
      length: length ?? this.length,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
