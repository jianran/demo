#!/usr/bin/env bash

ARTIFACT=demo
MAINCLASS=com.example.demo.DemoApplication
VERSION=0.0.1-SNAPSHOT

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

mkdir -p  /opt/demo-native/target/native-image

echo "Packaging $ARTIFACT with Maven"

JAR="$ARTIFACT-$VERSION.jar"
echo "Unpacking $JAR"
cd target/native-image
jar -xvf ../$JAR >/dev/null 2>&1
cp -R META-INF BOOT-INF/classes

LIBPATH=`find BOOT-INF/lib | tr '\n' ':'`
CP=BOOT-INF/classes:$LIBPATH

GRAALVM_VERSION=`native-image --version`
echo "Compiling $ARTIFACT with $GRAALVM_VERSION"
{ time native-image \
  --verbose \
  --initialize-at-build-time=javax.el.ListELResolver,javax.el.BeanELResolver,javax.el.MapELResolver,javax.el.CompositeELResolver \
  -H:Name=$ARTIFACT \
  -Dspring.native.dump-config=/tmp/rc.json \
  -cp $CP $MAINCLASS >> output.txt ; } 2>> output.txt

if [[ -f $ARTIFACT ]]
then
  printf "${GREEN}SUCCESS${NC}\n"
  mv ./$ARTIFACT /
  exit 0
else
  cat output.txt
  printf "${RED}FAILURE${NC}: an error occurred when compiling the native-image.\n"
  exit 1
fi
