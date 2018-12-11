// Copyright (c) 2017, yeradis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:haversine/haversine.dart';
import 'package:test/test.dart';

void main() {
  group('Simple Haversine distance tests', () {
    Haversine haversine;
    final lat1 = 41.139129;
    final lon1 = 1.402244;

    final lat2 = 41.139074;
    final lon2 = 1.402315;

    setUp(() {
      haversine = Haversine.fromDegrees(
          latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);
    });

    test('Distance from location 1 to location 2 - Should return non zero', () {
      expect(haversine.distance(), isNonZero);
    });

    test('Distance from location 1 to location 2 - Should return non negative',
        () {
      expect(haversine.distance(), isNonNegative);
    });

    test('Distance from location1 to same location should be Zero', () {
      final haversine = Haversine.fromDegrees(
          latitude1: lat1, longitude1: lon1, latitude2: lat1, longitude2: lon1);
      expect(haversine.distance(), isZero);
    });

    test('Distance having ceros values as coordinates should be Zero', () {
      final haversine = Haversine.fromDegrees(
          latitude1: 0.0, longitude1: 0.0, latitude2: 0.0, longitude2: 0.0);
      expect(haversine.distance(), isZero);
    });

    test('Distance from location1 to location2 should be around 8.53', () {
      expect(haversine.distance(), inInclusiveRange(8.5391, 8.5394));
    });

    test('Distance from location1 to location2 should greather than 8', () {
      expect(haversine.distance(), greaterThan(8));
    });

    test('Distance from location1 to location2 should less than 1', () {
      final haversine = Haversine.fromDegrees(
          latitude1: 41.140773,
          longitude1: 1.402221,
          latitude2: 41.140774,
          longitude2: 1.402222);
      expect(haversine.distance(), lessThan(1.0));
    });

    test('Distance from location1 to location2 should closer to 8', () {
      final haversine = Haversine.fromDegrees(
          latitude1: 41.140773,
          longitude1: 1.402221,
          latitude2: 41.140716,
          longitude2: 1.402279);
      final distance = haversine.distance();

      expect(distance, greaterThan(7.98));
      expect(distance, lessThan(8));
    });
  });

  group('Simple coordinate validation tests', () {
    setUp(() {});

    test('Having valid coordinates should no throw', () {
      final lat1 = 41.139129;
      final lon1 = 1.402244;

      final lat2 = 41.139074;
      final lon2 = 1.402315;

      expect(
          () => new Haversine.fromDegrees(
              latitude1: lat1,
              longitude1: lon1,
              latitude2: lat2,
              longitude2: lon2),
          returnsNormally);
    });

    test(
        'Constructor fromDegrees Having invalid latitude at coordinates 1 should throw FormatException',
        () {
      final lat1 = -122.4612387012154;
      final lon1 = 1.402244;

      final lat2 = 41.139074;
      final lon2 = 1.402315;

      expect(
          () => Haversine.fromDegrees(
              latitude1: lat1,
              longitude1: lon1,
              latitude2: lat2,
              longitude2: lon2),
          throwsA(predicate((e) =>
              e is FormatException &&
              e.message.contains("latitude1|longitude1"))));
    });

    test(
        'Constructor fromDegrees Having invalid latitude at coordinates 2 should throw FormatException',
        () {
      final lat1 = 41.139074;
      final lon1 = 1.402244;

      final lat2 = -122.4612387012154;
      final lon2 = 1.402315;

      expect(
          () => Haversine.fromDegrees(
              latitude1: lat1,
              longitude1: lon1,
              latitude2: lat2,
              longitude2: lon2),
          throwsA(predicate((e) =>
              e is FormatException &&
              e.message.contains("latitude2|longitude2"))));
    });

    test(
        'Constructor fromDegrees Having invalid lontigute at coordinates 2 should throw FormatException',
        () {
      final lat1 = 41.139129;
      final lon1 = 1.402244;

      final lat2 = 41.139074;
      final lon2 = 270.0;

      expect(
          () => Haversine.fromDegrees(
              latitude1: lat1,
              longitude1: lon1,
              latitude2: lat2,
              longitude2: lon2),
          throwsA(predicate((e) =>
              e is FormatException &&
              e.message.contains("latitude2|longitude2"))));
    });

    test(
        'Constructor fromRadians Having invalid lontigute at coordinates 2 should throw FormatException',
        () {
      final lat1 = 0.718013252451;
      final lon1 = 0.024473774716;

      final lat2 = 0.71801229252;
      final lon2 = 4.71239;

      expect(
          () => Haversine.fromRadians(
              latitude1: lat1,
              longitude1: lon1,
              latitude2: lat2,
              longitude2: lon2),
          throwsA(predicate((e) =>
              e is FormatException &&
              e.message.contains("latitude2|longitude2"))));
    });
  });
}
