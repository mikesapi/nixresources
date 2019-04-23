#! /bin/bash -e

install-packages.sh lm-sensors sysbench

outputDir="~/documents/admin/pchealth"
command="mkdir -p ${outputDir}"
eval $command

timestamp=$(date +%Y-%m-%d--%H-%M-%S)
outputPath="$outputDir/cpu-benchmark-$timestamp.log"
cmd="cpu-benchmark.sh > $outputPath"
eval $cmd

echo "Output written to: $outputPath"
