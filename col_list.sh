(printf "PERM LINKS OWNER GROUP SIZE DAY MONTH  "  ; \
printf "HH:MM/YEAR NAME\n" ; \
ls -Flh | sed 1d) | column -t
