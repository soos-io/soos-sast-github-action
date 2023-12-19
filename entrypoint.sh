#!/bin/bash -l

SOOS_APP_VERSION=${GITHUB_ACTION_REF}

SOOS_INTEGRATION_NAME="GitHub"
SOOS_INTEGRATION_TYPE="Plugin"

SOOS_BRANCH_NAME=${SOOS_BRANCH_NAME:-${GITHUB_REF}}
if [[ -n $SOOS_SAST_PATH ]]; then
    SOOS_SOURCE_CODE_PATH=${GITHUB_WORKSPACE}/${SOOS_SAST_PATH}
else
    SOOS_SOURCE_CODE_PATH=${GITHUB_WORKSPACE}
fi

PARAMS=(
    "--apiKey ${SOOS_API_KEY}"
    "--apiURL ${SOOS_API_URL}"
    "--appVersion ${SOOS_APP_VERSION}"
    "--branchName ${SOOS_BRANCH_NAME}"
    ${SOOS_BRANCH_URI:+--branchUri ${SOOS_BRANCH_URI}}
    ${SOOS_BUILD_URI:+--buildUri ${SOOS_BUILD_URI}}
    ${SOOS_BUILD_VERSION:+--buildVersion ${SOOS_BUILD_VERSION}}
    "--clientId ${SOOS_CLIENT_ID}"
    "--commitHash ${GITHUB_SHA}"
    ${SOOS_DIRECTORIES_TO_EXCLUDE:+--directoriesToExclude "${SOOS_DIRECTORIES_TO_EXCLUDE}"}
    ${SOOS_FILES_TO_EXCLUDE:+--filesToExclude "${SOOS_FILES_TO_EXCLUDE}"}
    "--integrationName ${SOOS_INTEGRATION_NAME}"
    "--integrationType ${SOOS_INTEGRATION_TYPE}"
    ${SOOS_LOG_LEVEL:+--logLevel ${SOOS_LOG_LEVEL}}
    "--onFailure" "${SOOS_ON_FAILURE}"
    "--projectName" "${SOOS_PROJECT_NAME}"
    "--sourceCodePath ${SOOS_SOURCE_CODE_PATH}"
    ${SOOS_VERBOSE:+--verbose}
)


set -x
soos-sast "${PARAMS[@]}"
