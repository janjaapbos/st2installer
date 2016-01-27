#!/usr/bin/env sh

if [ -n "$DEBUG" ]; then
    PUPPET_DEBUG_ARGS="--debug --verbose"
else
    PUPPET_DEBUG_ARGS=""
fi

# Command used to invoke puppet run
COMMAND="/usr/bin/sudo FACTER_installer_running=true ENV=current_working_directory NOCOLOR=true /usr/bin/puprun ${PUPPET_DEBUG_ARGS}"

echo "Running command: ${COMMAND}"
${COMMAND}

EXIT_CODE=$?
exit ${EXIT_CODE}
