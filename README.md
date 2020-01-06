# Introduction

This project is for creating Garmin maps from OSM data. See <https://wiki.openstreetmap.org/wiki/Mkgmap/help/How_to_create_a_map> for complete instructions.

The map data (*.pbf) files in this folder were downloaded from <https://download.geofabrik.de>

# Locations

[Canary Islands](https://download.geofabrik.de/africa/canary-islands-latest.osm.pbf)

[Great Britain](https://download.geofabrik.de/europe/great-britain-latest.osm.pbf)

[Ireland](https://download.geofabrik.de/europe/ireland-and-northern-ireland-latest.osm.pbf)

[Other European Countries](https://download.geofabrik.de/europe.html)

# Split the PBF file into tiles

Use a command like;

```
java -jar splitter.jar regions/canary-islands-latest.osm.pbf --output-dir=out/canaryislands
```

# Get the bounds data

Bounds can be downloaded from <http://osm.thkukuk.de/data/bounds-latest.zip>

# Get the precompiled sea data

Seah data can be downloaded from http://osm.thkukuk.de/data/sea-latest.zip


# Create the Garmin Map

Use a command like;

```
java -jar mkgmap.jar --route --add-pois-to-areas --bounds=bounds --index --cycle-map  --gmapsupp out/canaryislands/6324*.osm.pbf --output-dir=images/canaryislands
```

# Concatenate two maps (had problems getting this to work)

Use a command like;

```
java -jar mkgmap.jar --gmapsupp your-existing-map.img map-you-want-to-add.img
```

# Splitter Commands used

```
  586  java -jar splitter.jar regions/canary-islands-latest.osm.pbf --output-dir=out/canaryislands --mapid=73240001
  588  java -jar splitter.jar regions/great-britain-latest.osm.pbf --output-dir=out/gb --mapid=83240001
  591  java -jar splitter.jar regions/spain-latest.osm.pbf --output-dir=out/spain --mapid=93240001
  593  java -jar splitter.jar regions/italy-latest.osm.pbf --output-dir=out/italy --mapid=13240001
  595  java -jar splitter.jar regions/dach-latest.osm.pbf --output-dir=out/dach --mapid=23240001
  600  java -jar splitter.jar regions/sweden-latest.osm.pbf --output-dir=out/sweden --mapid=33240001
  601  java -jar splitter.jar regions/sweden-latest.osm.pbf --output-dir=out/sweden --mapid=43240001
  603  java -jar splitter.jar regions/ireland-and-northern-ireland-latest.osm.pbf --output-dir=out/ireland --mapid=53240001
```

# MkgMap Command

I had problems getting maps to concatenate using mkgmap so I changed the mapid for each location used and then created a single map image.  even with this I had memory issues creating a large map with all locations, so best just to create separate images for the locations you need.

```
java -Xmx2000M -jar mkgmap.jar --route --add-pois-to-areas --precomp-sea=sea-latest.zip --bounds=bounds-latest.zip --index --gmapsupp tiles/*.osm.pbf --cycle-map --output-dir=images/
```