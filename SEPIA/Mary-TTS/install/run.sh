#!/bin/bash
cd bin
export MARYTTS_SERVER_OPTS="-Dsocket.addr=0.0.0.0"
bash marytts-server

