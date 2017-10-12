# haversine.dart ![Travis status][travis_status] [![Coverage Status][coverage_status]][coverage_page]

Simple [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula) implementation 
to calculate geographic distance on earth having a pair of Latitude/Longitude points.

> The haversine formula determines the great-circle distance between two points on a sphere given their longitudes and latitudes.

The formula in this library works on the basis of a spherical earth, 
which is [accurate enough](https://gis.stackexchange.com/questions/25494/how-accurate-is-approximating-the-earth-as-a-sphere#25580) for most purposes.

`Disclaimer`: The earth is not quite a sphere. This means that errors from assuming spherical geometry might be considerable depending on the points, so: `don't trust your life on this value`.

Check [this](https://gis.stackexchange.com/questions/25494/how-accurate-is-approximating-the-earth-as-a-sphere#25580) detailed information.

[travis_status]: https://travis-ci.org/yeradis/haversine.dart.svg?branch=master
[coverage_page]: https://coveralls.io/github/yeradis/haversine.dart?branch=master
[coverage_status]: https://coveralls.io/repos/github/yeradis/haversine.dart/badge.svg?branch=master 