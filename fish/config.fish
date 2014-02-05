### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin 
set postgres /Applications/Postgres93.app/Contents/MacOS/bin
set lejos /opt/leJOS_NXJ_0.9.1beta-3/bin
set -gx PATH $lejos $postgres $homebrew $default_path
