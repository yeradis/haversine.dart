import 'dart:math';

class Haversine {
  late double latitude1;
  late double longitude1;

  late double latitude2;
  late double longitude2;

  Haversine.fromDegrees(
      {double? latitude1, double? longitude1, double? latitude2, double? longitude2}) {
    if (latitude1 == null || longitude1 == null || latitude2 == null || longitude2 == null) {
      throw ArgumentError.notNull();
    }
    this.latitude1 = _radiansFromDegrees(latitude1);
    this.longitude1 = _radiansFromDegrees(longitude1);

    this.latitude2 = _radiansFromDegrees(latitude2);
    this.longitude2 = _radiansFromDegrees(longitude2);

    _throwExceptionOnInvalidCoordinates();
  }

  Haversine.fromRadians(
      {double? latitude1, double? longitude1, double? latitude2, double? longitude2}) {
    if (latitude1 == null || longitude1 == null || latitude2 == null || longitude2 == null) {
      throw ArgumentError.notNull();
    }
    this.latitude1 = latitude1;
    this.longitude1 = longitude1;

    this.latitude2 = latitude2;
    this.longitude2 = longitude2;

    _throwExceptionOnInvalidCoordinates();
  }

  void _throwExceptionOnInvalidCoordinates() {
    String invalidDescription = """
            A coordinate is considered invalid if it meets at least one of the following criteria:
            - Its latitude is greater than 90 degrees or less than -90 degrees.
            - Its longitude is greater than 180 degrees or less than -180 degrees.
            
            see https://en.wikipedia.org/wiki/Decimal_degrees
        """;

    if (!_isValidCoordinate(this.latitude1, this.longitude1))
      throw FormatException(
          "Invalid coordinates at latitude1|longitude1\n$invalidDescription");

    if (!_isValidCoordinate(this.latitude2, this.longitude2))
      throw FormatException(
          "Invalid coordinates at latitude2|longitude2\n$invalidDescription");
  }

  double distance() {
    // Implementation of the Haversine formula to calculate geographic distance on earth
    // see https://en.wikipedia.org/wiki/Haversine_formula
    // Accuracy: This offer calculations on the basis of a spherical earth (ignoring ellipsoidal effects)

    double lat1 = this.latitude1;
    double lon1 = this.longitude1;

    double lat2 = this.latitude2;
    double lon2 = this.longitude2;

    var EarthRadius = 6378137.0; // WGS84 major axis
    double distance = 2 *
        EarthRadius *
        asin(sqrt(pow(sin(lat2 - lat1) / 2, 2) +
            cos(lat1) * cos(lat2) * pow(sin(lon2 - lon1) / 2, 2)));

    return distance;
  }

  double _radiansFromDegrees(final double degrees) => degrees * (pi / 180.0);

  /// A coordinate is considered invalid if it meets at least one of the following criteria:
  ///
  /// - Its latitude is greater than 90 degrees or less than -90 degrees.
  ///- Its longitude is greater than 180 degrees or less than -180 degrees.
  bool _isValidCoordinate(double latitude, longitude) =>
      _isValidLatitude(latitude) && _isValidLongitude(longitude);

  /// A latitude is considered invalid if its is greater than 90 degrees or less than -90 degrees.
  bool _isValidLatitude(double latitudeInRadians) =>
      !(latitudeInRadians < _radiansFromDegrees(-90.0) ||
          latitudeInRadians > _radiansFromDegrees(90.0));

  /// A longitude is considered invalid if its is greater than 180 degrees or less than -180 degrees.
  bool _isValidLongitude(double longitudeInRadians) =>
      !(longitudeInRadians < _radiansFromDegrees(-180.0) ||
          longitudeInRadians > _radiansFromDegrees(180.0));
}
