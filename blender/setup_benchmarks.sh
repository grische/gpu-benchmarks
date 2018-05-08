#!/bin/bash

DOWNLOAD_FOLDER="$HOME/Downloads"
TMP_FOLDER="/tmp"

mkdir -p $DOWNLOAD_FOLDER
cd $TMP_FOLDER/

echo "Downloading and extracting blender files into $TMP_FOLDER"

# Get the blender cycles benchmark files
wget -c https://download.blender.org/demo/test/cycles_benchmark_20160228.zip -P $DOWNLOAD_FOLDER/  || exit $?
unzip $DOWNLOAD_FOLDER/cycles_benchmark_20160228.zip || exit $?
#rm    $DOWNLOAD_FOLDER/cycles_benchmark_20160228.zip || exit $?


# Get the blender gooseberry benchmark files and cleanup
wget -c http://download.blender.org/demo/test/benchmark.zip -P $DOWNLOAD_FOLDER/  || exit $?
unzip $DOWNLOAD_FOLDER/benchmark.zip -d $TMP_FOLDER/benchmark/gooseberry          || exit $?
#rm    $DOWNLOAD_FOLDER/benchmark.zip                                              || exit $?

#rearrange gooseberry folder structure
mv    $TMP_FOLDER/benchmark/gooseberry/benchmark/* $TMP_FOLDER/benchmark/gooseberry/  || exit $?
rmdir $TMP_FOLDER/benchmark/gooseberry/benchmark                                      || exit $?
mv    $TMP_FOLDER/benchmark/gooseberry/benchmark.blend benchmark/gooseberry/gooseberry.blend || exit $?
