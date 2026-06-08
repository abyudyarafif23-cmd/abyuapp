#!/usr/bin/env sh
################################################################################
# Gradle start up script for UN*X
################################################################################

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS="-Xmx1g"

APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
else
    JAVACMD=$(command -v java 2>/dev/null || true)
fi

if [ -z "$JAVACMD" ] || [ ! -x "$JAVACMD" ] ; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH." \
        "Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
else
    JAVACMD=java
fi

if [ ! -x "$JAVACMD" ] ; then
    echo "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH." 1>&2
    exit 1
fi

# Determine the path to the gradle home directory.
PRG="$0"
while [ -h "$PRG" ] ; do
  ls=$(ls -ld "$PRG")
  link=$(expr "$ls" : '.*-> \(.*\)$')
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=$(dirname "$PRG")/$link
  fi
done

GRADLE_HOME=$(cd "$(dirname "$PRG")" && pwd)

CLASSPATH="$GRADLE_HOME/gradle/wrapper/gradle-wrapper.jar"

# Additional JVM options.
JVM_OPTS="$DEFAULT_JVM_OPTS"

# Execute Gradle.
exec "$JAVACMD" $JVM_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
