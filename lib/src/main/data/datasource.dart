import 'package:dio/dio.dart';
import 'package:vrit_app/core/api/config.dart';
import 'package:vrit_app/core/api/env.dart';

class UrlDataSource {
  final Dio _dio = Dio();

  Future<String> getShortUrl(String longUrl) async {
    try {
      final response = await _dio.post(
        ApiEndpoint.baseUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': host,
          },
        ),
        data: {
          'url': longUrl,
        },
      );

      return response.data['result_url'];
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}