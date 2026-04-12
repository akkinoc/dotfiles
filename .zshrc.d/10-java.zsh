if [[ -x /usr/libexec/java_home ]] && /usr/libexec/java_home -Fv 21 &>/dev/null; then
    export JAVA_HOME="$(/usr/libexec/java_home -Fv 21)"
fi
