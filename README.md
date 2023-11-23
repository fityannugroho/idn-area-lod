# Linked Indonesian Area Data

The [linked](https://en.wikipedia.org/wiki/Linked_data) version of [idn-area-data](https://github.com/fityannugroho/idn-area-data).

## Data

The linked data is available in [`src/res`](/src/res) directory. It is generated from CSV data in [`idn-area-data`](https://github.com/fityannugroho/idn-area-data) using [CSV2RDF converter](https://github.com/atomgraph/csv2rdf).

## Ontology

We have defined the custom ontology for this dataset which is available in [`src/definition.ttl` file](/src/definitions.ttl).

## Usage

You can use the linked data by creating a [SPARQL query](https://en.wikipedia.org/wiki/SPARQL) to retrieve the data you want.

For example, the SPARQL below will retrieve all provinces data with the number of regencies of each provinces.

```rq
PREFIX idnarea: <http://raw.githubusercontent.com/fityannugroho/idn-area-lod/main/src/definitions.ttl#>

SELECT ?code ?name (COUNT(?regency) AS ?regencyCount)
FROM <http://raw.githubusercontent.com/fityannugroho/idn-area-lod/main/src/res/provinces.ttl#>
FROM <http://raw.githubusercontent.com/fityannugroho/idn-area-lod/main/src/res/regencies.ttl#>
WHERE {
  ?province a idnarea:Province ;
    idnarea:code ?code ;
    idnarea:name ?name .
  ?regency a idnarea:Regency ;
    idnarea:isPartOf ?province .
}
GROUP BY ?code ?name
ORDER BY ASC(?code)
```

> See another query examples in [`examples`](/examples) directory.

Then, you can **execute that SPARQL query with general SPARQL processor / editor**, like https://sparql.org/sparql.html.

And this is the result if you choose the output in CSV:

```csv
code,name,regencyCount
11,ACEH,23
12,SUMATERA UTARA,33
13,SUMATERA BARAT,19
14,RIAU,12
15,JAMBI,11
16,SUMATERA SELATAN,17
17,BENGKULU,10
18,LAMPUNG,15
19,KEPULAUAN BANGKA BELITUNG,7
21,KEPULAUAN RIAU,7
31,DKI JAKARTA,6
32,JAWA BARAT,27
33,JAWA TENGAH,35
34,DAERAH ISTIMEWA YOGYAKARTA,5
35,JAWA TIMUR,38
36,BANTEN,8
51,BALI,9
52,NUSA TENGGARA BARAT,10
53,NUSA TENGGARA TIMUR,22
61,KALIMANTAN BARAT,14
62,KALIMANTAN TENGAH,14
63,KALIMANTAN SELATAN,13
64,KALIMANTAN TIMUR,10
65,KALIMANTAN UTARA,5
71,SULAWESI UTARA,15
72,SULAWESI TENGAH,13
73,SULAWESI SELATAN,24
74,SULAWESI TENGGARA,17
75,GORONTALO,6
76,SULAWESI BARAT,6
81,MALUKU,11
82,MALUKU UTARA,10
91,PAPUA,9
92,PAPUA BARAT,13
93,PAPUA SELATAN,4
94,PAPUA TENGAH,8
95,PAPUA PEGUNUNGAN,8
```
