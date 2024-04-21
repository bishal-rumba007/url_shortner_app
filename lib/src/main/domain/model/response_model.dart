
class ShortUrlModel {
  final String longUrl;
  final String shortUrl;
  final String? customSlug;
  final String qrCodeData;

  ShortUrlModel({
    required this.longUrl,
    required this.shortUrl,
    this.customSlug,
    required this.qrCodeData,
  });


  factory ShortUrlModel.fromJson(Map<String, dynamic> json) {
    return ShortUrlModel(
      longUrl: json['destination'],
      shortUrl: json['shortUrl'],
      customSlug: json['slashtag'],
      qrCodeData: json['shortUrl'],
    );
  }
}