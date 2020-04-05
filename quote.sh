#!/bin/bash

INDEX=$(cat ./popular_quotes.json | jq '.quotes | length')
R=$(shuf -i 0-$(($INDEX - 1)) -n 1)
cat popular_quotes.json | jq -r ".quotes[$R] | (.quote + \"\n― \" + .author)"
