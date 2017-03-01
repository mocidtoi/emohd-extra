#!/bin/bash

jarsigner -verbose -keystore dhome-release-key.keystore "$1" alias_dhome

echo ""
echo ""
echo "Checking if APK is verified..."
jarsigner -verify "$1"

