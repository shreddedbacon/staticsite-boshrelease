#!/bin/bash
echo "Create the docroot base directory"
mkdir -p $(dirname <%= p('docroot') %>)
echo "If it our docroot already exists within it, delete it"
if [[ -d "<%= p('docroot') %>" ]]
then
  rm -rf <%= p('docroot') %>
fi
echo "Copy our new docroot into the base directory"
cp -a /var/vcap/packages/staticsite <%= p('docroot') %>
echo "Make sure vcap owns it"
chown -R vcap:vcap <%= p('docroot') %>
