class PartDto {
  final String? text;
  final InlineDataDto? inlineData;

  const PartDto({
    this.text,
    this.inlineData,
  });

  factory PartDto.fromJson(Map<String, dynamic> json) {
    return PartDto(
      text: json['text'] as String?,
      inlineData: json['inlineData'] != null
          ? InlineDataDto.fromJson(json['inlineData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (text != null) 'text': text,
      if (inlineData != null) 'inlineData': inlineData!.toJson(),
    };
  }
}

class InlineDataDto {
  final String? mimeType;
  final String? data;

  const InlineDataDto({
    this.mimeType,
    this.data,
  });

  factory InlineDataDto.fromJson(Map<String, dynamic> json) {
    return InlineDataDto(
      mimeType: json['mimeType'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (mimeType != null) 'mimeType': mimeType,
      if (data != null) 'data': data,
    };
  }
}
