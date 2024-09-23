#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

# Create the bridge
sudo ip link add name br0 type bridge

# Set the bridge up
sudo ip link set dev br0 up

# Add interfaces to the bridge
sudo ip link set dev veth-host1 master br0
sudo ip link set dev veth-host2 master br0
sudo ip link set dev veth-host3 master br0
sudo ip link set dev veth-host4 master br0

# Set the interfaces up
sudo ip link set dev veth-host1 up
sudo ip link set dev veth-host2 up
sudo ip link set dev veth-host3 up
sudo ip link set dev veth-host4 up

# Optional: Set bridge parameters
sudo sysctl net.bridge.bridge-nf-call-iptables=0
sudo sysctl net.bridge.bridge-nf-call-ip6tables=0

# Optional: Enable STP (Spanning Tree Protocol)
sudo brctl stp br0 on

# Display bridge information
sudo brctl show br0
