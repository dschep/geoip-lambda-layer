# GeoIP Lambda Layer
This is the source project for an AWS Lambda Layer that contains [MaxMind](https://maxmind.com)'s
free GeoLite2 geo IP databases and the C library for reading them and python3.6 build of the
library against it.

## ARNs
Since layers must exist in the same region as your function, this layer is available with the
following ARNs in all the regions:

- `arn:aws:lambda:ap-south-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:eu-west-3:377024778620:layer:geoip:1`
- `arn:aws:lambda:eu-west-2:377024778620:layer:geoip:1`
- `arn:aws:lambda:eu-west-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:ap-northeast-2:377024778620:layer:geoip:1`
- `arn:aws:lambda:ap-northeast-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:sa-east-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:ca-central-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:ap-southeast-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:ap-southeast-2:377024778620:layer:geoip:1`
- `arn:aws:lambda:eu-central-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:us-east-1:377024778620:layer:geoip:2`
- `arn:aws:lambda:us-east-2:377024778620:layer:geoip:1`
- `arn:aws:lambda:us-west-1:377024778620:layer:geoip:1`
- `arn:aws:lambda:us-west-2:377024778620:layer:geoip:1`

All ARNs above are for a fully qualified version, which is what you must specify with your function
declaration.

## DB path when Lambda is executing
The GeoLite2 libraries can be found at the following paths in your running Lambda:
 * `/opt/maxminddb/GeoLite2-City.mmdb`
 * `/opt/maxminddb/GeoLite2-Country.mmdb`
 * `/opt/maxminddb/GeoLite2-ASN.mmdb`

## How to use
See [this blogpost](https://serverless.com/blog/PATH) and
[the example](https://github.com/serverless/geoip-lambda-layer/tree/master/example)
for how to use this layer with the [Serverless Framework](https://serverless.com).
