## PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set lejos /opt/leJOS_NXJ_0.9.1beta-3/bin
set postgres /Applications/Postgres93.app/Contents/MacOS/bin
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set cabal_bin $HOME/.cabal/bin
set finnbuild /opt/finnbuild/latest/bin
set -gx PATH $finnbuild $cabal_bin $rbenv_bin $rbenv_shims $postgres $lejos $homebrew $default_path

### BOOT2DOCKER ###
# set -x DOCKER_CERT_PATH /Users/torvatn/.docker/machine/machines/localdocker;
# set -x DOCKER_HOST "tcp://192.168.99.100:2376"
set -x DOCKER_HOST "tcp://192.168.59.103:2376"
set -x DOCKER_CERT_PATH "/Users/torvatn/.boot2docker/certs/boot2docker-vm"
set -x DOCKER_TLS_VERIFY 1

### LOCALE ###
set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"

### SBT ###
set -x SBT_OPTS "-XX:+CMSClassUnloadingEnabled -Xmx1500M"

### JAVA ###
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

## ANDROID ##
set ANDROID_HOME "/usr/local/opt/android-sdk"

rbenv rehash >/dev/null ^&1

. /opt/z-fish/z.fish
