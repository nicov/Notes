#!/bin/bash
source /home/fsdz0585/.bashrc
cd /var/www//fsdz0585/notes/
thin start -e production -p 8080 -d
