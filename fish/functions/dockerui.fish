function dockerui 
  docker run -d -p 9000:9000 -v /var/run/docker.sock:/docker.sock crosbymichael/dockerui -e /docker.sock
end
