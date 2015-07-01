#!/bin/bash
# pwn_lab/tools/rebuild_box.sh
# Copyright (C) 2015 Zach Grace (ztgrace)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# See <http://www.gnu.org/licenses/> for a copy of the GNU General
# Public License

box=$1

if [ -z $1 ]; then
    echo "Usage: $0 box_name"
    exit 1
fi

rm package.box
vagrant box remove $box
vagrant package --base $box

