#!/bin/bash

java -Xmx2000M -jar splitter.jar \
  regions/great-britain-latest.osm.pbf \
  --output-dir=out/gb \
  --mapid=83240001 \
  --description="OSM GB March 2024"

java -Xmx2000M -jar splitter.jar \
  regions/canary-islands-latest.osm.pbf \
  --output-dir=out/ci \
  --mapid=73240001 \
  --description="OSM Canary Islands March 2024"

java -Xmx2000M -jar splitter.jar \
  regions/ireland-and-northern-ireland-latest.osm.pbf \
  --output-dir=out/gb \
  --mapid=93240001 \
  --description="OSM Ireland March 2024"