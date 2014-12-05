function j 
  switch (echo $argv)
    case 6
      set -x JAVA_HOME (/usr/libexec/java_home -v 1.6)

    case 7
      set -x JAVA_HOME (/usr/libexec/java_home -v 1.7)

    case 8
      set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

  end
end
