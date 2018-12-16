#!/bin/bash

# This script runs a command line function in a while loop  with the option to
# have a greenbar text background, -g.
# The default interval is 5 seconds which can be overridden with the -d option.
# -h or --help for info, help, and all options.

# This file was created on 24/02/18
# Author: George Kaimakis - https://github.com/geokai


# help function
_loop.usage () {
    printf '  %b\n'\
        ""\
        "---------------------------------------------------------------------"\
        "${INFO}USAGE${RESET}  loop_this  [OPTIONS]...  COMMAND..."\
        "                      Loops the command with a delay interval"\
        "---------------------------------------------------------------------"\
        "${INFO}SYNOPSIS${RESET}"\
        "  loop_this [-d NUM|--delay NUM] [-g|--greenbar] [--] COMMAND "\
        "                      Provide COMMAND as would be written"\
        "                      at the command-line."\
        "                      e.g.: $ cat -n logfile.log"\
        ""\
        "${INFO}DESCRIPTION${RESET}"\
        "  -h, --help,         Print this help and exit."\
        ""\
        "  -d NUM, --delay NUM Set the delay in NUM seconds, from 1 to 30."\
        "                      NUM will be automatically clamped to 1-30."\
        "                      Default 5 seconds if value is not supplied."\
        ""\
        "  -g, --greenbar,     Activates the 'greenbar' style background text."\
        "                      Mimics the green ruled computer print-out"\
        "                      paper from the golden era of computing."\
        ""\
        "${INFO}NOTES${RESET}"\
        "  Caution: commands that do not require arguments may loop"\
        "  without output."\
        "  Command aliases may not be honored."\
        "  To quit the loop and exit, issue a CTRL-C"\
        "---------------------------------------------------------------------"\
        ""
    return 1
}


# fatal error warning
_error.warning () {
        echo -e "\n${ERROR}ERROR${RESET}: command failed! check command line args.\n"
        return 2
}


# minor error warning
_warning.warning () {
        echo -e "\n${WARNING}WARNING${RESET}: command failed! check command line args.\n"
        return 2
}


# prints the command being run and the delay value at the head of the terminal
_header () {
    echo -en "${INFO}cmd${RESET}: ${item}\n"
    echo -e "${INFO}int${RESET}: ${interval:-$default_interval}s\n"
}


_delay_interval_clamp () {
    if [[ $interval -lt 1 ]]; then
        interval=1
    elif [[ $interval -gt 30 ]]; then
        interval=30
    else
        interval=$interval
    fi
}


# configure curosr visibility
trap 'tput cnorm; ' EXIT  # reset cursor on EXIT
tput civis  # hide cursor


# configure the command loop with or without the greenbar background
_command.loop () {
    while :; do
        clear
        if [[ greenbar -eq 1 ]]; then
            _header
            ${item} >& /dev/null    # this is a hack!!
            err=$?
            if [ $err -ne 0 ]; then
                _error.warning
                return $?
            else
                ${item} | greenbar2
            fi
        else
            _header
            ${item} 2> /dev/null
            err=$?
            # echo $?
        fi
        if [ $err -ne 0 ]; then
            _error.warning
            return $?
        fi
        sleep "${interval:-$default_interval}"
    done
}


# main function
loop_this () {

    # initialize local defaults
    # set color formatting variables:
    unset RESET ERROR WARNING SUCCESS INFO

    local RESET="\033[00m"        # default
    local ERROR="\033[1;31m"      # red
    local WARNING="\033[1;33m"    # yellow
    local SUCCESS="\033[1;32m"    # green
    local INFO="\033[1;34m"       # blue


    # print usage info and exit if no argumants provided
    (( $# )) || {
        _loop.usage
        return $?
    }


    # initialize variables
    unset greenbar interval default_interval
    greenbar=0
    default_interval=5


    # parse command line argumants
    while :; do
        # case ${1#-} in
        case ${1} in
            --)
                shift
                break
            ;;

            -h|-\?|--help)
                _loop.usage
                return $?
            ;;

            -g|--greenbar)
                # _source.greenbar
                # source ~/bin/local/greenbar2.sh
                source greenbar2.sh
                greenbar=1
                shift
            ;;

            -d|--delay)
                # check that parameter $2 is a number, not an alpha string
                if [ $2 -eq $2 ]; then
                    interval=$2
                    shift 2
                else
                    shift 1
                fi
            ;;

            -)
                _loop.usage
                return $?
            ;;

            -?*)
                _loop.usage
                return $?
            ;;

            *)
                break
                # _loop.usage
                # return $?
            ;;

        esac
        # shift
    done


    # initialize command variables
    unset item
    item=$@     # after option params have been parsed and shifted, 
                # collect remaining args


    # check if interval is empty, and if not, send to be clamped
    if [[ -n "$interval" ]]; then
        _delay_interval_clamp $interval
    fi


    # check a command has been passed
    if [[ -z $item ]]; then
        _warning.warning
        return $?
    else
        _command.loop
    fi
}   # ---- end of main function, 'loop_this' ----


# call the main function with the remaining command line args
loop_this $@


# ----- End of 'loop_this.sh' file ----- #
