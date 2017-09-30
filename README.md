# haversine

Simple [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula) implementation 
to calculate geographic distance on earth having a pair of Latitude/Longitude points.

> The haversine formula determines the great-circle distance between two points on a sphere given their longitudes and latitudes.

The formula in this library works on the basis of a spherical earth, 
which is [accurate enough](https://gis.stackexchange.com/questions/25494/how-accurate-is-approximating-the-earth-as-a-sphere#25580) for most purposes.

`Disclaimer`: The earth is not quite a sphere. This means that errors from assuming spherical geometry might be considerable depending on the points, so: don't trust your life on this value`.

Check [this](https://gis.stackexchange.com/questions/25494/how-accurate-is-approximating-the-earth-as-a-sphere#25580) detailed information. 