import 'dart:math';

class Haversine {

    double latitude1;
    double longitude1;

    double latitude2;
    double longitude2;

    Haversine.fromDegrees({this.latitude1, this.longitude1, this.latitude2, this.longitude2}) {
        this.latitude1 = _radiansFromDegrees(latitude1);
        this.longitude1 = _radiansFromDegrees(longitude1);

        this.latitude2 = _radiansFromDegrees(latitude2);
        this.longitude2 = _radiansFromDegrees(longitude2);
    }

    Haversine.fromRadiams({this.latitude1, this.longitude1, this.latitude2, this.longitude2}) {
        this.latitude1 = latitude1;
        this.longitude1 = longitude1;

        this.latitude2 = latitude2;
        this.longitude2 = longitude2;
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
        double distance = 2 * EarthRadius * asin(
            sqrt(
                pow(sin(lat2 - lat1) / 2, 2)
                    + cos(lat1)
                    * cos(lat2)
                    * pow(sin(lon2 - lon1) / 2, 2)
            )
        );

        return distance;
    }

    double _radiansFromDegrees(final double degrees) {
        return degrees * (PI / 180.0);
    }
}
