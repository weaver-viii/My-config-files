function docker-enter
  boot2docker ssh -t "[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter; sudo /var/lib/boot2docker/docker-enter $argv";
end
