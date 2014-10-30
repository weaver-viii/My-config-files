function containerclean
  docker rm (docker ps -a -q)
end
