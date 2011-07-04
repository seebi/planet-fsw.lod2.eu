#!/usr/bin/env bash

# ouput the header
cat index-head.tt

feeds=`curl -s "http://www.w3.org/2005/Incubator/federatedsocialweb/wiki/index.php?title=PlanetFSW" | grep "<li>" | grep external | cut -d "\"" -f 2`
echo -n "<http://planet-fsw.lod2.eu/> foaf:made "

first="true"
for feed in $feeds
do
    if [[ "$first" == "true" ]]; then
        first="false"
    else
        echo ", "
    fi
    echo -n "<$feed>"
done
echo " ."
echo " "

for feed in $feeds
do
    echo "<$feed> a rss:channel; rdfs:label \"$feed\" . "
done

