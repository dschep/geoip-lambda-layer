# GeoIP Lambda Layer
This is the source project for an AWS Lambda Layer that contains [MaxMind](https://maxmind.com)'s
free GeoLite2 geo IP databases and the C library for reading them and python3.6 build of the
library against it.

## ARN
The arn for this layer is: `arn:aws:lambda:us-east-1:377024778620:layer:geoip`

The fully qualified arn with the latest version is: `arn:aws:lambda:us-east-1:377024778620:layer:geoip:1`

## DB path when Lambda is executing
The GeoLite2 libraries can be found at the following paths in your running Lambda:
 * `/opt/maxminddb/GeoLite2-City.mmdb`
 * `/opt/maxminddb/GeoLite2-Country.mmdb`
 * `/opt/maxminddb/GeoLite2-ASN.mmdb`

## How to use
See [this blogpost](https://serverless.com/blog/PATH) and
[the example](https://github.com/serverless/geoip-lambda-layer/tree/master/example)
for how to use this layer
with the [Serverless](https://serverless.com).
