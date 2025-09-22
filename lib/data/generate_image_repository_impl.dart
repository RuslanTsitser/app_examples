import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../domain/generate_image_repository.dart';
import 'dto/gemini_response_dto.dart';

class GenerateImageRepositoryImpl implements GenerateImageRepository {
  const GenerateImageRepositoryImpl();

  @override
  Future<Uint8List?> generateImage({
    required Uint8List image,
    required String prompt,
  }) async {
    final base64Image = base64Encode(image);
    final dio = Dio();
    const apiKey = String.fromEnvironment('GEMINI_KEY');
    dio.options.headers['x-goog-api-key'] = apiKey;
    dio.options.headers['Content-Type'] = 'application/json';
    log('HELLO request');
    final response = await dio.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image-preview:generateContent',
      data: {
        'contents': [
          {
            'parts': [
              {
                'text': prompt,
              },
              {
                'inline_data': {
                  'mime_type': 'image/png',
                  'data': base64Image,
                },
              },
            ],
          },
        ],
      },
    );
    log('HELLO response ');

    final generateResponse = GeminiResponseDto.fromJson(response.data);
    log('HELLO generateResponse');
    final result = generateResponse.candidates?.first.content?.parts?.first.inlineData?.data;
    if (result == null) return null;
    log('HELLO result');
    final imageBytes = base64Decode(result);
    log('HELLO imageBytes');
    return imageBytes;
  }

  @override
  Future<String> generateText({required String prompt}) async {
    final dio = Dio();
    const apiKey = String.fromEnvironment('GEMINI_KEY');
    dio.options.headers['x-goog-api-key'] = apiKey;
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
      data: {
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
      },
    );

    final generateResponse = GeminiResponseDto.fromJson(response.data);
    final result = generateResponse.candidates?.first.content?.parts?.first.text;
    log(result ?? '');
    return result ?? '';
  }
}
