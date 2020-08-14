# GeoIP Lambda Layer
This is the source project for an AWS Lambda Layer that contains [MaxMind](https://maxmind.com)'s
free GeoLite2 geo IP databases and the C library for reading them and python3.6 build of the
library against it.

## Register for a Maxmind license key

Prior to 2019 the GeoIPLite2 databases were available to download without registration.
Since then you are now required to register a free account to download the databases.

Once you've signed up, login in to their user dashboard and select:
> Services -> My License Key -> Generate new license key

You may additionally need to navigate to the `GeoLite2` section and approve any legal terms and conditions to get access to the databases.

Once you've done that you should be able to see the `GeoIP2 / GeoLite2 -> Download Files` page.

see: https://blog.maxmind.com/2019/12/18/significant-changes-to-accessing-and-using-geolite2-databases/

## Build
```bash
export MAXMIND_LICENSE_KEY='xxxxxxxxx'
```

```bash
./build
```

## Deploy
```bash
sls deploy
```

## DB path when Lambda is executing
The GeoLite2 libraries can be found at the following paths in your running Lambda:
 * `/opt/maxminddb/GeoLite2-City.mmdb`
 * `/opt/maxminddb/GeoLite2-Country.mmdb`
 * `/opt/maxminddb/GeoLite2-ASN.mmdb`

## How to use
Check out [the example](https://github.com/serverless/geoip-lambda-layer/tree/master/example)
for how to use this layer with the [Serverless Framework](https://serverless.com).
