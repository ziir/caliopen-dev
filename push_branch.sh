#!/bin/bash

source common.sh

# Load local variables
if [[ -f "caliopen.env" ]];
then
	source caliopen.env
fi

if [[ "x${LOCAL_DIR}" == "x" ]];
then
	LOCAL_DIR="${DEFAULT_LOCAL_DIR}"
fi

branch=$1

cd ${LOCAL_DIR}
here=`pwd`
for comp in $COMPONENTS
do
	echo "## Component ${comp}"
	cd ${PROJECT_NAME}.${comp}
	exist=`git branch |grep ${branch}`
	if [[ "${exist}" == "* ${branch}" ]];
	then
		git push origin ${branch}
		if [[ $? -ne 0 ]];
		then
			echo "Error pushing ${branch} on remote for component ${branch}"
			exit $?
		fi
	elif [[ "${exist}" == "  ${branch}" ]];
	then
		git co ${branch}
		if [[ $? -ne 0 ]];
		then
			echo "Error checkout ${branch} for component ${branch}"
			exit $?
		fi
		git push origin ${branch}
		if [[ $? -ne 0 ]];
		then
			echo "Error pushing ${branch} on remote for component ${branch}"
			exit $?
		fi
	else
		echo "No branch ${branch} on component ${comp}"
	fi
	cd ${here}
done