
import 'package:flutter_sanity_image_url/flutter_sanity_image_url.dart';
class SanityImageSource {
  String imageUrl;

  SanityImageSource(this.imageUrl);

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
    };
  }

  factory SanityImageSource.fromJson(Map<String, dynamic> json) {
    return SanityImageSource(
      json['imageUrl'],
    );
  }

  String getImageUrl() {
    return imageUrl;
  }
}