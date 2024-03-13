#!/bin/bash

java -Xmx2000M -jar mkgmap.jar --route \
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

java -Xmx2000M -jar mkgmap.jar --route \
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

 java -Xmx2000M -jar mkgmap.jar --route \
 --add-pois-to-areas \
 --precomp-sea=data/sea-latest.zip \
 --bounds=data/bounds-latest.zip \
 --index \
 --gmapsupp \
 --cycle-map \
 --output-dir=images/ireland/ \
 -c out/ireland/template.args \
 --mapname=93240001 \
 out/ireland/9324*.osm.pbf