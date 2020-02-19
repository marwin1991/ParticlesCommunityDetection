#!/bin/bash
docker rm -f particles
docker build -t particles . 
docker run -v D:/ParticlesCommunityDetection/data:/particles/snap/examples/particle/data --privileged --name particles -d particles
