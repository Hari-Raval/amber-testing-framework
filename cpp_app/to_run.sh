set -x
lscpu > results/toucan_lscpu
./main_occupancy > results/toucan_main_occupancy.txt
./main_over_occupancy > results/toucan_main_over_occupancy.txt
