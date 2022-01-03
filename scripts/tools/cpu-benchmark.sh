#! /bin/bash -e

# Note install the following: install-packages.sh lm-sensors sysbench

echo "****************************************************"
echo "## Starting the benchmark and temperature monitoring"
timestamp=$(date +%Y-%m-%d--%H-%M-%S)
echo $timestamp
echo " "

echo "####################################################"
lshw -short | grep -i cpu
echo " "
echo "Idle temperature: ----------------------------------"
sensors
echo "####################################################"
echo " "
echo " "

echo "## Running CPU test: ###############################"
echo " "
sysbench --num-threads=4 --validate=on --test=cpu --cpu-max-prime=50000 run | grep 'total time:\|min:\|avg:\|max:' | tr -s [:space:]
echo " "
echo "Temperature: ---------------------------------------"
sensors
echo "####################################################"
echo " "
echo " "

echo "Running Threads test: ##############################"
echo " "
sysbench --num-threads=4 --validate=on --test=threads --thread-yields=20000 --thread-locks=8 run | grep 'total time:\|min:\|avg:\|max:' | tr -s [:space:]
echo " "
echo "Temperature: ---------------------------------------"
sensors
echo "####################################################"
echo " "

echo "####################################################"
sleep 10
echo "After 10 seconds temperature: ----------------------"
sensors
echo "####################################################"
echo " "
echo " "


echo "Done"
echo "****************************************************"
