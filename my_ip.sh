#!/bin/bash


# utilizing jq, the command line json handling program.


_ip="$(curl -s ifconfig.me/all.json | jq -r '.ip_addr')"

echo "$_ip"
