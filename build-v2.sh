#!/bin/bash
meteor build ../emohd-build --directory --server=http://dhome.local:3000/
cd ../emohd-build/bundle
rm -fr programs/server/npm/node_modules/meteor/npm-container/node_modules
tar -xzf ../../emohd-extra/h3-homegate/node_modules.tgz
cd ..
tar -czf emohd.tgz bundle/
