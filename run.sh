#!/bin/bash

echo on
docker build -t spring-webflux . && docker run -p 8080:8080 spring-webflux
