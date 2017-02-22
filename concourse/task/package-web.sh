#!/bin/bash

cd source-code
./mvnw package

cp target/concourse-demo-web*.jar ../target-web/concourse-demo-web.jar
