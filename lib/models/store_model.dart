class StoreModel {
  final String code;
  final String storeLocation;
  final double latitude;
  final double longitude;
  final String storeAddress;
  final String timezone;
  final double distance;
  final bool isNearestStore;
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  StoreModel({
    required this.code,
    required this.storeLocation,
    required this.latitude,
    required this.longitude,
    required this.storeAddress,
    required this.timezone,
    required this.distance,
    required this.isNearestStore,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      code: json['code'] ?? '',
      storeLocation: json['storeLocation'] ?? '',
      latitude: double.tryParse(json['latitude'].toString()) ?? 0.0,
      longitude: double.tryParse(json['longitude'].toString()) ?? 0.0,
      storeAddress: json['storeAddress'] ?? '',
      timezone: json['timezone'] ?? '',
      distance: double.tryParse(json['distance'].toString()) ?? 0.0,
      isNearestStore: json['isNearestStore'] == 1,
      dayOfWeek: json['dayOfWeek'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
    );
  }
}
