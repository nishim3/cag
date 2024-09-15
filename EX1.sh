#!/bin/bash

# Set GMT defaults
gmt set MAP_FRAME_TYPE fancy
gmt set FONT_TITLE 12p,Helvetica
gmt set FONT_ANNOT_PRIMARY 12p,Helvetica

# Define region and projection
REGION="-R68/100/24/40"
PROJECTION="-JQ"  # Cylindrical equidistant projection with map width 15 cm
INTERVALS="-B4g4"    # 4-degree gridlines for both lat/long

# Create the base map with fancy borders and specified region
gmt psbasemap $REGION $PROJECTION $INTERVALS -BWSne+t"Tectonic Map" -K > tectonic_map.ps

# Plot coastal boundaries in black
gmt pscoast $REGION $PROJECTION -W0.75p -Df -A1000 -K -O >> tectonic_map.ps

# Plot national boundaries in red
gmt pscoast $REGION $PROJECTION -N1/1p,red -Df -K -O >> tectonic_map.ps

# Plot all permanent rivers in blue
gmt pscoast $REGION $PROJECTION -I1/0.75p,blue -Df -O >> tectonic_map.ps

# Convert to PDF for better quality output
gmt psconvert tectonic_map.ps -A -P -Tf
