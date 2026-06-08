@echo off
setlocal

set DEFAULT_JVM_OPTS=-Xmx1g
set APP_NAME=Gradle
set APP_BASE_NAME=%~n0

rem Determine the Java command to use to start the JVM.
if defined JAVA_HOME (
    if exist "%JAVA_HOME%\jre\bin\java.exe" (
        set "JAVACMD=%JAVA_HOME%\jre\bin\java.exe"
    ) else (
        set "JAVACMD=%JAVA_HOME%\bin\java.exe"
    )
) else (
    set "JAVACMD=java"
    for /f "delims=" %%i in ('where java 2^>nul') do (
        if exist "%%i" set "JAVACMD=%%i"
    )
)

if not exist "%JAVACMD%" (
    echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
    exit /b 1
)

set "GRADLE_HOME=%~dp0"
set "CLASSPATH=%GRADLE_HOME%\gradle\wrapper\gradle-wrapper.jar"

"%JAVACMD%" %DEFAULT_JVM_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*
