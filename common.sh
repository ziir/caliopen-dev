#!/usr/bin/env bash

# Load local variables
if [ -f caliopen.env ]; then
    echo "Loading env from caliopen.env"
    source caliopen.env
fi

# All backends components
CALIOPEN_COMPONENTS="base base.user base.message api.base api.message messaging smtp web cli frontend"

# Default values that can be overidden in a cassandra.env file
DEFAULT_BASE_URL="git@github.com:CaliOpen"
DEFAULT_LOCAL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"


# Set BASE_URL LOCAL_DIR
if [[ "x${BASE_URL}" == "x" ]]; then
    BASE_URL="${DEFAULT_BASE_URL}"
fi

if [[ "x${LOCAL_DIR}" == "x" ]]; then
    LOCAL_DIR="${DEFAULT_LOCAL_DIR}"
fi

CALIOPEN_DIR="${LOCAL_DIR}"

export BASE_URL CALIOPEN_DIR CALIOPEN_COMPONENTS
