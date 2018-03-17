#!/bin/bash

expect="https://example.com/"

schemes=(
  http
  https
)

domains=(
  www.example.com
  example.org
  www.example.org
)

for domain in "${domains[@]}"; do
  printf "\033[1;32m$domain\033[0m\n"

  for scheme in "${schemes[@]}"; do
    url="$scheme"://"$domain"/

    if [ "$url" == "$expect" ]; then
      printf " \033[1;33m* Skipping $url\033[0m\n"
      continue
    fi

    res=`curl -D - -s -o /dev/null "$url" | grep Location | awk -F ": " '{print $2}' | tr -dc '[[:print:]]'`

    if [ "$res" == "$expect" ]; then
      printf " \033[1;34m✔ $scheme\033[0m\n"
    elif [ "$res" == "" ]; then
      printf " \033[1;31m× NOT FOUND ($scheme)\033[0m\n"
    else
      printf " \033[1;31m× $scheme\033[0m\n"
    fi
  done;

  printf "\n"
done
