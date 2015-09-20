#!/bin/bash
set -e

MAVEN_VERSION=3.2.5

echo -e "\e[43m\n                    \n   Install MAVEN ($MAVEN_VERSION) ...\n\e[0m"

MAVEN_ARCHIVE_FILENAME=apache-maven-${MAVEN_VERSION}-bin.tar.gz
MAVEN_HOME=/opt/$(echo $MAVEN_ARCHIVE_FILENAME | sed -e 's,-bin\.tar\.gz$,,')
MAVEN_ARCHIVE_URL=https://dist.apache.org/repos/dist/release/maven/maven-3/${MAVEN_VERSION}/binaries/${MAVEN_ARCHIVE_FILENAME}
MAVEN_ARCHIVE_LOCAL_CACHE=/vagrant/cache/$MAVEN_ARCHIVE_FILENAME
MAVEN_PROFILE_FILENAME=/etc/profile.d/maven.sh

[[ -e $MAVEN_ARCHIVE_LOCAL_CACHE ]] || \
wget --quiet -O $MAVEN_ARCHIVE_LOCAL_CACHE $MAVEN_ARCHIVE_URL

tar -C $(dirname $MAVEN_HOME) -zxf $MAVEN_ARCHIVE_LOCAL_CACHE

cat > $MAVEN_PROFILE_FILENAME <<EOF
export PATH=$MAVEN_HOME/bin:\$PATH
EOF
