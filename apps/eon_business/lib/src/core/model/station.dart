class Station {
  String stationId;
  double latitude;
  double longitude;
  String address;
  String stationName;
  String stationType;
  DateTime availableAt;
  List<String> connectors;
  double powerKw;
  double price;
  String priceUnit;
  String priceCurrency;
  String moderationStatus;

  Station({
    required this.stationId,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.stationName,
    required this.stationType,
    required this.availableAt,
    required this.connectors,
    required this.powerKw,
    required this.price,
    required this.priceUnit,
    required this.priceCurrency,
    required this.moderationStatus,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationId: json['station_id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      stationName: json['station_name'],
      stationType: json['station_type'],
      availableAt: DateTime.parse(json['available_at']),
      connectors: List<String>.from(json['connectors']),
      powerKw: json['power_kw'],
      price: json['price'],
      priceUnit: json['price_unit'],
      priceCurrency: json['price_currency'],
      moderationStatus: json['moderation_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'station_id': stationId,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'station_name': stationName,
      'station_type': stationType,
      'available_at': availableAt.toIso8601String(),
      'connectors': connectors,
      'power_kw': powerKw,
      'price': price,
      'price_unit': priceUnit,
      'price_currency': priceCurrency,
      'moderation_status': moderationStatus,
    };
  }
}
