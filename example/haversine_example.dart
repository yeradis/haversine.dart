// Copyright (c) 2017, yeradis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:haversine/haversine.dart';

main() {
  final lat1 = 41.139129;
  final lon1 = 1.402244;

  final lat2 = 41.139074;
  final lon2 = 1.402315;

  final haversine = Haversine.fromDegrees(
      latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);

  print('Distance from location 1 to 2 is : ${haversine.distance()}');
}
