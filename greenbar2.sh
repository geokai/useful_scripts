# this function re-formats the output of any stream of text
# resulting in alternating light and dark green background
# similar to the old-school computer print paper

greenbar2() {
    awk '{if (NR%2==1) {
        print "\033[48;5;115m\033[38;5;235m" $0 "\033[0m"}
        else {
            print "\033[48;5;41m\033[38;5;235m" $0 "\033[0m"}}'
}
