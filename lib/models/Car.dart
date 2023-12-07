import 'SanityImageSource.dart';

class Car {
  String brand;
  String model;
  int price;
  String condition;
  String gearbox;
  double speed;
  int seat;
  int topSpeed;
  String color;
  String motor;
  String id;
  List<SanityImageSource> images;

  Car(this.brand, this.model, this.price, this.condition, this.gearbox, this.speed, this.seat, this.topSpeed, this.color, this.motor, this.id, this.images);

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'price': price,
      'condition': condition,
      'gearbox': gearbox,
      'speed': speed,
      'seat': seat,
      'topSpeed': topSpeed,
      'color': color,
      'motor': motor,
      'id': id,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }

  factory Car.fromJsonApi(Map<String, dynamic> json) {
    try {
      return Car(
        json['brand'],
        json['model'],
        json['price'],
        "ready", // Assuming default value for 'condition' is "ready"
        json['gearbox'],
        json['speed'],
        json['seat'],
        json['topSpeed'],
        json['color'],
        json['motor'],
        json['id'],
        (json['images'] is List<dynamic>)
            ? (json['images'] as List<dynamic>).map((image) => SanityImageSource.fromJson(image)).toList()
            : <SanityImageSource>[SanityImageSource(json['images'])], // Wrap the string in a list
      );
    } catch (e) {
      print('Error parsing Car.fromJsonApi: $e');
      print('Raw JSON: $json');
      rethrow;
    }
  }

}

