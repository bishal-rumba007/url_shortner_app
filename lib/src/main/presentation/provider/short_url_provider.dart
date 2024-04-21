



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrit_app/src/main/data/url_repository_impl.dart';

final shortUrlProvider = FutureProvider.family<String, String>((ref, String url) {
  return UrlRepositoryImpl().getShortenedUrl(url);
});