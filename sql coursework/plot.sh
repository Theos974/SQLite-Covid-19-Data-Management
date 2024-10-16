       SUM(deaths) OVER (PARTITION BY countryterritoryCode ORDER BY strftime('%Y-%m-%d', dateRep)) AS CumulativeDeaths
FROM CaseData
WHERE countryterritoryCode IN ('"${IDS[@]}"')  -- include all IDs
GROUP BY dateRep
ORDER BY dateRep;
SQL

# Prepare the GnuPlot script
GNUPLOT_SCRIPT=$(mktemp)
cat > "$GNUPLOT_SCRIPT" <<EOF
set terminal png size 1024,768
set output 'graph.png'
set datafile separator ','
set xdata time
set timefmt '%Y-%m-%d'
set format x '%Y-%m-%d'
set xlabel 'Date'
set ylabel 'Cumulative Deaths'
set title 'Cumulative COVID-19 Deaths Top 10 Countries'
set grid
set key autotitle columnhead
set key reverse Left

plot "$TEMP_DATA" using 1:2 with linespoints title 'Cumulative Deaths'
EOF

# Run the GnuPlot script
gnuplot "$GNUPLOT_SCRIPT"

# Clean up temporary files
rm "$TEMP_DATA" "$GNUPLOT_SCRIPT"
