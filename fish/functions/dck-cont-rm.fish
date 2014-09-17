function dck-cont-rm
  docker rm (docker ps -a -q)
end
