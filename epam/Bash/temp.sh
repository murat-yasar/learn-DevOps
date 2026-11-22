#!/bin/bash

# Get the temperature
temp="$1"

# Get the scale (C/K)
scale=${temp:${#temp}-1:1}

# Get the degree
degree=${temp:0:${#temp}-1}

case $scale in
  "C") ((result=$degree+273)); echo "$result""K" ;;
  "K") ((result=$degree-273)); echo "$result""C" ;;
esac

# echo "Temperature: $temp"
# echo "Degree: $degree"
# echo "Scale: $scale"
# echo "$1 = $result"