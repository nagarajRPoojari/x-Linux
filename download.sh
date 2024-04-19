#!/bin/bash

echo "===>Downloading packages..."
cat wget-list | while read line; do
    wget $line
done

echo "===>Verifying MD5SUM..."
cat md5sums | while read line; do
    MD5=$(echo $line | cut -d ' ' -f 1)
    FILE=$(echo $line | cut -d ' ' -f 2)

    if ! echo "$MD5 $FILE" | md5sum -c; then
        echo "===>Verification of $FILE failed! MD5 mismatch!"
        exit 1
    fi
done 

