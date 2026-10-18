#!/bin/sh
# Minimal Gradle wrapper launcher for POSIX systems.
# Do not use `exec` for the version check: it would terminate this script
# before GradleWrapperMain can be launched.
set -eu

if [ -n "${JAVA_HOME:-}" ] && [ -x "${JAVA_HOME}/bin/java" ]; then
  JAVACMD="${JAVA_HOME}/bin/java"
else
  JAVACMD="$(command -v java || true)"
fi

if [ -z "${JAVACMD}" ]; then
  echo "Error: Java was not found. Set JAVA_HOME or add java to PATH." >&2
  exit 1
fi

if ! "${JAVACMD}" -version >/dev/null 2>&1; then
  echo "Error: The Java command could not be executed: ${JAVACMD}" >&2
  exit 1
fi

APP_HOME="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
WRAPPER_JAR="${APP_HOME}/gradle/wrapper/gradle-wrapper.jar"

if [ ! -f "${WRAPPER_JAR}" ]; then
  echo "Error: Gradle wrapper JAR not found: ${WRAPPER_JAR}" >&2
  exit 1
fi

# Gradle's wrapper JAR has no Main-Class manifest entry, so launch the wrapper
# by its fully qualified main class rather than with `java -jar`.
exec "${JAVACMD}" -classpath "${WRAPPER_JAR}" org.gradle.wrapper.GradleWrapperMain "$@"
