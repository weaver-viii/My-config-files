function dck-img-rm
  docker rmi (docker images | grep "^<none>" | awk '{print $3}')
end
