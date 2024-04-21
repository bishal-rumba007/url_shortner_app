



import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrit_app/src/main/data/url_repository_impl.dart';

final shortUrlProvider = FutureProvider.family.autoDispose<String, String>((ref, String url) {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 10), () {
    link.close();
  });

  ref.onDispose(() => timer.cancel());
  return UrlRepositoryImpl().getShortenedUrl(url);
});