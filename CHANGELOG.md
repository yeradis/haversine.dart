# Changelog

## 0.0.1

- Initial version for calculating geographic distance using the Haversine formula 

## 0.0.2
- Minor update, now using the WGS84 major axis for the Earth radius

## 1.0.0
Added coordinates validation. 
A coordinate is considered invalid if it meets at least one of the following criteria:
- Its latitude is greater than 90 degrees or less than -90 degrees.
- Its longitude is greater than 180 degrees or less than -180 degrees.

see [Decimal degrees](https://en.wikipedia.org/wiki/Decimal_degrees)