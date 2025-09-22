import 'candidate_dto.dart';

class GeminiResponseDto {
  final List<CandidateDto>? candidates;

  const GeminiResponseDto({
    this.candidates,
  });

  factory GeminiResponseDto.fromJson(Map<String, dynamic> json) {
    return GeminiResponseDto(
      candidates: json['candidates'] != null
          ? (json['candidates'] as List<dynamic>)
                .map((candidate) => CandidateDto.fromJson(candidate as Map<String, dynamic>))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (candidates != null) 'candidates': candidates!.map((candidate) => candidate.toJson()).toList(),
    };
  }
}
