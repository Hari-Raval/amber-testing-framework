#
# Stacked histograms
#
set term pdf size 6,3
set output 'output.pdf'
set title "distribution of tests across semi-fair schedulers"

# Where to put the legend
# and what it should contain
set key invert reverse Left outside
set key autotitle columnheader

set yrange [0:100]
set ylabel "total % of tests"
set xlabel "different synthesis runs"

# Define plot style 'stacked histogram'
# with additional settings
set style data histogram
set style histogram rowstacked
set style fill solid border -1
set boxwidth 0.5

set arrow from 4.5, graph 0 to 4.5, graph 1 nohead

# We are plotting columns 2, 3 and 4 as y-values,
# the x-ticks are coming from column 1
plot 'data.dat' using 5:xtic(1) \
    ,'' using 4 \
    ,'' using 3 \
    ,'' using 2