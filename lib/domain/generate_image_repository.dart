import 'dart:typed_data';

abstract interface class GenerateImageRepository {
  Future<Uint8List?> generateImage({
    required Uint8List image,
    required String prompt,
  });

  Future<String> generateText({
    required String prompt,
  });
}
