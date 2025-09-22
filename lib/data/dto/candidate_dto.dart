import 'content_dto.dart';

class CandidateDto {
  final ContentDto? content;
  final String? role;
  final String? finishReason;
  final int? index;

  const CandidateDto({
    this.content,
    this.role,
    this.finishReason,
    this.index,
  });

  factory CandidateDto.fromJson(Map<String, dynamic> json) {
    return CandidateDto(
      content: json['content'] != null ? ContentDto.fromJson(json['content'] as Map<String, dynamic>) : null,
      role: json['role'] as String?,
      finishReason: json['finishReason'] as String?,
      index: json['index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (content != null) 'content': content!.toJson(),
      if (role != null) 'role': role,
      if (finishReason != null) 'finishReason': finishReason,
      if (index != null) 'index': index,
    };
  }
}
