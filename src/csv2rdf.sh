#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage:   $0 <base_url>" >&2
  echo "Example: $0 https://localhost:4443/" >&2
  exit 1
fi

base="$1"

# Provinces
cat node_modules/idn-area-data/data/provinces.csv \
  | docker run -i -a stdin -a stdout -a stderr -v "$(pwd)/src/provinces.rq":/tmp/provinces.rq \
  atomgraph/csv2rdf /tmp/provinces.rq "$base" > src/res/provinces.ttl

# Regencies
cat node_modules/idn-area-data/data/regencies.csv \
  | docker run -i -a stdin -a stdout -a stderr -v "$(pwd)/src/regencies.rq":/tmp/regencies.rq \
  atomgraph/csv2rdf /tmp/regencies.rq "$base" > src/res/regencies.ttl

# Districts
cat node_modules/idn-area-data/data/districts.csv \
  | docker run -i -a stdin -a stdout -a stderr -v "$(pwd)/src/districts.rq":/tmp/districts.rq \
  atomgraph/csv2rdf /tmp/districts.rq "$base" > src/res/districts.ttl

# Villages
cat node_modules/idn-area-data/data/villages.csv \
  | docker run -i -a stdin -a stdout -a stderr -v "$(pwd)/src/villages.rq":/tmp/villages.rq \
  atomgraph/csv2rdf /tmp/villages.rq "$base" > src/res/villages.ttl

# Islands
# cat node_modules/idn-area-data/data/islands.csv \
#   | docker run -i -a stdin -a stdout -a stderr -v "$(pwd)/src/islands.rq":/tmp/islands.rq \
#   atomgraph/csv2rdf /tmp/islands.rq "$base" > src/res/islands.ttl
