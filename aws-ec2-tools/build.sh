#!/bin/bash

#SRC_DIR=$RECIPE_DIR/ec2-api-tools-1.7.1.0

cp -r $SRC_DIR/bin ${PREFIX}/bin
cp -r $SRC_DIR/lib ${PREFIX}/lib

# Convert binaries to use 
# export EC2_HOME=$PREFIX

# Mac only
# export JAVA_HOME=$(/usr/libexec/java_home)

# OSX ONLY
function set_env_variables {
    binary=$1
    mv $binary $binary.old
    echo "#!/usr/bin/env bash" >  $binary
    echo "export EC2_HOME=/opt/anaconda1anaconda2anaconda3" >> $binary
    echo "export JAVA_HOME=\`/usr/libexec/java_home\` " >> $binary
    tail -n +2 $binary.old >> $binary
    rm $binary.old
    chmod +x $binary
}

pushd $PREFIX/bin

for item in `ls * | grep -v "\.cmd"`
do 
    set_env_variables $item
done

popd
