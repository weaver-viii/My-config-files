function imageclean
  docker rmi (docker images | grep "^<none>" | awk '{print $3}')
end
