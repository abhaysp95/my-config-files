#!/usr/bin/env sh

## define battery

Battery() {
	BATPER=$(acpi --battery | cut -d, -f2)
	echo "$BATPER"
}

# print the percent
while true; do
	echo "%{r}%{F#eeddff}%{U#ffffff} $(Battery)"
	sleep 1;
done
