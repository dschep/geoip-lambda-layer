import json

import geoip2.database


def geoip(event, context):
    reader = geoip2.database.Reader("/opt/maxminddb/GeoLite2-City.mmdb")
    response = reader.city(event["requestContext"]["identity"]["sourceIp"])
    return {
        "body": json.dumps(
            {
                "city": response.city.name,
                "state": response.subdivisions.most_specific.name,
                "country": response.country.name,
            }
        )
    }
