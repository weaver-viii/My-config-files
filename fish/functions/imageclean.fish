function imageclean
  set images (docker images -a --filter dangling=true -q)
  if count $images > 0
    docker rmi images
  else
    echo "Ingen images å slette!"
  end
end
