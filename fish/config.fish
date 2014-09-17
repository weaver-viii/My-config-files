### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set lejos /opt/leJOS_NXJ_0.9.1beta-3/bin
set postgres /Applications/Postgres93.app/Contents/MacOS/bin
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set -gx PATH $rbenv_bin $rbenv_shims $postgres $lejos $homebrew $default_path

### BOOT2DOCKER ###
set -x DOCKER_HOST "tcp://192.168.59.103:2375"


### SBT ###
set -x SBT_OPTS "-XX:+CMSClassUnloadingEnabled -Xmx1500M -XX:MaxPermSize=512M"

rbenv rehash >/dev/null ^&1

. /opt/z-fish/z.fish
