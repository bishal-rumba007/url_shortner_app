


import 'package:vrit_app/src/main/data/datasource.dart';
import 'package:vrit_app/src/main/domain/repositories/url_repository.dart';

class UrlRepositoryImpl implements UrlRepository {
  final UrlDataSource urlDataSource = UrlDataSource();

  UrlRepositoryImpl();

  @override
  Future<String> getShortenedUrl(String url) async {
    return await urlDataSource.getShortUrl(url);
  }
}
