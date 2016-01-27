#!/usr/bin/env sh

# Note: We enable DEBUG mode by default so we get more useful info
PUPPET_DEBUG_ARGS="--debug --verbose"

# Command used to invoke puppet run
COMMAND="/usr/bin/sudo FACTER_installer_running=true ENV=current_working_directory NOCOLOR=true /usr/bin/puprun ${PUPPET_DEBUG_ARGS}"

echo "Running command: ${COMMAND}"
${COMMAND}

EXIT_CODE=$?
exit ${EXIT_CODE}
