import 'part_dto.dart';

class ContentDto {
  final List<PartDto>? parts;

  const ContentDto({
    this.parts,
  });

  factory ContentDto.fromJson(Map<String, dynamic> json) {
    return ContentDto(
      parts: json['parts'] != null
          ? (json['parts'] as List<dynamic>).map((part) => PartDto.fromJson(part as Map<String, dynamic>)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (parts != null) 'parts': parts!.map((part) => part.toJson()).toList(),
    };
  }
}
