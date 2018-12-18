#!/bin/sh
first_run(){
  mkdir /mongodb/data
  cd /root
  tar -xzvf leanote-linux-amd64-v2.6.1.bin.tar.gz
  chmod +x /root/leanote/bin/run.sh
  start_bd
  restore_bd
  start_service
}

start_service(){
  start_bd
  /root/leanote/bin/run.sh
}

start_bd(){
  mongod --dbpath /mongodb/data/ --bind_ip 127.0.0.1 &
}

restore_bd(){
  mongorestore -h localhost -d leanote --dir /root/leanote/mongodb_backup/leanote_install_data
}

[ -d "/mongodb/data" ] && start_service || first_run
