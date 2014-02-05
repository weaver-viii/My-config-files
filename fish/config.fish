### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin 
set postgres /Applications/Postgres93.app/Contents/MacOS/bin
set -gx PATH $postgres $homebrew $default_path
