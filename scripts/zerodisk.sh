#!/bin/bash

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
sync
sync
