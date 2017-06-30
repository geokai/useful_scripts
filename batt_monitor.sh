# this script queries the io registers and calculates the battery status and
# outputs to STDOUT:
ioreg -l | grep -E '(Max|Current)Capacity' | cut -d= -f2 | perl -e'@b=<STDIN>; printf"%f%%\n",100*$b[1]/$b[0]'
