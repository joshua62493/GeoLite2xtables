#! /bin/bash
/usr/local/src/GeoLite2xtables/00_download_geolite2 ;
sed -i '1d' /tmp/GeoLite2-Country-Locations-en.csv ;
awk '{gsub(/\"/,"")};1' /tmp/GeoLite2-Country-Locations-en.csv > /tmp/GeoLite2-Country-Locations-en2.csv ;
cat /tmp/GeoLite2-Country-Blocks-IPv{4,6}.csv | /usr/local/src/GeoLite2xtables/20_convert_geolite2 /tmp/GeoLite2-Country-Locations-en2.csv > /usr/share/xt_geoip/GeoIP-legacy.csv ;
/usr/lib/xtables-addons/xt_geoip_build -D /usr/share/xt_geoip /usr/share/xt_geoip/GeoIP-legacy.csv ;
rm /tmp/GeoLite2-Country*
