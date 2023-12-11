
class Reservation {
   String carId;
   DateTime startTime;
   DateTime endTime;
   String customerId;
   String bookingId;


  Reservation(this.carId, this.startTime, this.endTime, this.customerId, this.bookingId);

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'startTime': startTime,
      'endTime': endTime,
      'customerId': customerId,
      'bookingId': bookingId,
    };
  }

  factory Reservation.fromJsonApi(Map<String, dynamic> json) {
    try {
      return Reservation(
        json['carId'],
        json['startTime'],
        json['endTime'],
        json['customerId'],
        json['bookingId'],
      );
    } catch (e) {
      print('Error parsing Reservation.fromJsonApi: $e');
      print('Raw JSON: $json');
      rethrow;
    }
  }

}

