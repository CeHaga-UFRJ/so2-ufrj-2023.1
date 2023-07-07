#!/bin/bash

function start()
{
  echo "Começando..."
}

function stop()
{
  echo "Parando..."
}

function restart()
{
  echo "Reiniciando..."
}

case $1 in
  start)
    start;;
  stop)
    stop;;
  restart)
    restart;;
  *)
    echo "Uso: $0 <start|stop|restart>"
    exit 1
esac
