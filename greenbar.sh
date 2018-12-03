# This script formats every other line with a green background


greenbar() {
    awk '{if (NR%2==1) {
        print "\033[48;5;35m" $0 "\033[0m"}
        else {
            print}}'
}
