#!/bin/bash
# Author: 	Markus Pesch
# Descript:	setup git for db lesson

# BASE
WORKSPACE="${HOME}/workspace"
MASTER="https://github.com/fh-trier/tgdb_ws1718.git"

# Input
echo "Bitte gebe deinen richtigen Vor- und Nachnamen ein."
read NAME

echo "Bitte gebe deine E-Mail Adresse der Hochschule ein."
read EMAIL

echo "Bitte gebe deinen Benutzernamen von github.com ein"
read USER

FORK="https://github.com/${USER}/tgdb_ws1718.git"

# Set git config
git config --global user.name ${NAME}
git config --global user.email ${EMAIL}
echo "git config is up to date"

# Create Workspace
mkdir -p "${WORKSPACE}/${USER}"
cd "${WORKSPACE}/${USER}"

# Download repo
git clone ${MASTER}
cd tgdb_ws1718
git remote set-url origin --add --push ${FORK}
git remote add ${USER} ${FORK}

git remote -v

