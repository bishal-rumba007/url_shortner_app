import 'package:dio/dio.dart';
import 'package:vrit_app/core/api/config.dart';
import 'package:vrit_app/core/api/api_keys.dart';
import 'package:vrit_app/core/network/export_network.dart';

class UrlDataSource {
  final Dio _dio = Dio();

  Future<String> getShortUrl(String longUrl) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw NoInternetException();
    }
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
      throw ApiRequestException(e.message.toString());
    }
  }
}