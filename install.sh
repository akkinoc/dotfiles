#!/bin/bash

set -eux
cd $(dirname $0)

ln -is ${PWD}/.gitconfig ~
ln -is ${PWD}/.gitattributes ~
