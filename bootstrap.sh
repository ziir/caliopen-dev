#!/bin/bash

# Bootsrap caliopen development environment.
# Create a virtualenv
# Fetch git repositories
# setup python packages
# compile webapp
# setup storage

# on debian 8 we need.
#  python-dev libffi-dev

# Load common
source common.sh

# Load local variables
if [[ -f "caliopen.env" ]];
then
	echo "Loading env from caliopen.env"
	source caliopen.env
fi


# Set BASE_URL LOCAL_DIR
if [[ "x${BASE_URL}" == "x" ]];
then
	BASE_URL="${DEFAULT_BASE_URL}"
fi

if [[ "x${LOCAL_DIR}" == "x" ]];
then
	LOCAL_DIR="${DEFAULT_LOCAL_DIR}"
fi


# Setup virtualenv
if [[ ! -d "${LOCAL_DIR}/.env" ]]; then
	echo "Create virtualenv ${LOCAL_DIR}/.env"
	virtualenv "${LOCAL_DIR}/.env"
fi

source "${LOCAL_DIR}/.env/bin/activate"
if [[ "x${VIRTUAL_ENV}" == "x" ]]
then
	echo "Fail to activate virtualenv, abort"
	exit 1
fi

# Clone components
cd $LOCAL_DIR

for c in $COMPONENTS
do
	echo "Cloning ${c}"
	git clone "${BASE_URL}/${PROJECT_NAME}.${c}.git"
	cd ${PROJECT_NAME}.${c}
	if [[ "${BASE_URL}" != "${DEFAULT_BASE_URL}" ]];
	then
		echo "Add git upstream remote for ${c}"
		git remote add upstream ${DEFAULT_BASE_URL}/${PROJECT_NAME}.${c}.git
	fi
	python setup.py develop
	if [[ -f requirements.txt ]];
	then
		pip install -r requirements.txt
	fi
	cd -
done

# TODO get external dependencies (cassandra, elasticsearch)

# Compile js
cd "${PROJECT_NAME}.ng"
source ngactivate
npm install
bower install
grunt build
cd ..

# Prepare web app
cd "${PROJECT_NAME}.web"
cp development.ini.sample development.ini

caliopen -f development.ini setup