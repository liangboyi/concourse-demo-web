#!/bin/bash

cd repo
./mvnw package

cp target/concourse-demo-web*.jar ../target-web/concourse-demo-web.jar
