import 'SanityImageSource.dart';

class Dealer {
  String name;
  int offers;
  String id;
  SanityImageSource image;

  Dealer(this.name, this.offers, this.id, this.image);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'offers': offers,
      'image': image,
      'id': id,
    };
  }

  factory Dealer.fromJsonApi(Map<String, dynamic> json) {
    try {
      return Dealer(
        json['name'],
        json['offers'],
        json['id'],
        ((json['image'] is List<dynamic>)
            ? SanityImageSource.fromJson(json['image'][0]) // Take the first image if it's a list
            : SanityImageSource.fromJson(json['image'])), // Use the single image directly
      );
    } catch (e) {
      print('Error parsing Car.fromJsonApi: $e');
      print('Raw JSON: $json');
      rethrow;
    }
  }

}