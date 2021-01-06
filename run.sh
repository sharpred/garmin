#!/bin/bash
#rm -fR out/gb/*

#rm -fR images/*

#rm -fR regions/*

#cd ./regions && { curl -LO https://download.geofabrik.de/africa/canary-islands-latest.osm.pbf ; cd ..; }

#cd ./regions && { curl -LO https://download.geofabrik.de/europe/great-britain-latest.osm.pbf ; cd ..; }

#cd ./data && { curl -LO http://osm.thkukuk.de/data/sea-latest.zip ; cd ..; }

#cd ./data && { curl -LO http://osm.thkukuk.de/data/bounds-latest.zip ; cd ..; }

java -Xmx2000M -jar splitter.jar \
  regions/great-britain-latest.osm.pbf \
  --output-dir=out/gb \
  --mapid=83240001 \
  --description="OSM GB Jan 2021"

java -Xmx2000M -jar splitter.jar \
  regions/canary-islands-latest.osm.pbf \
  --output-dir=out/ci \
  --mapid=73240001 \
  --description="OSM Canary Islands Jan 2021"


java -Xmx2000M -jar mkgmap.jar \ 
 --route \
 --add-pois-to-areas \
 --precomp-sea=data/sea-latest.zip \
 --bounds=data/bounds-latest.zip \
 --index \
 --gmapsupp \
 --cycle-map \
 --output-dir=images/gb/ \
 -c out/gb/template.args \
 --mapname=83240001 \
 out/gb/8324*.osm.pbf

 java -Xmx2000M -jar mkgmap.jar \ 
 --route \
 --add-pois-to-areas \
 --precomp-sea=data/sea-latest.zip \
 --bounds=data/bounds-latest.zip \
 --index \
 --gmapsupp \
 --cycle-map \
 --output-dir=images/ci/ \
 -c out/ci/template.args \
 --mapname=73240001 \
 out/ci/7324*.osm.pbf