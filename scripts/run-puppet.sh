#!/usr/bin/env sh

if [ -n "$DEBUG" ]; then
    PUPPET_DEBUG_ARGS="--debug --verbose"
else
    PUPPET_DEBUG_ARGS=""
fi

# Command used to invoke puppet run
COMMAND="/usr/bin/sudo FACTER_installer_running=true ENV=current_working_directory NOCOLOR=true /usr/bin/puprun ${PUPPET_DEBUG_ARGS}"

# Note: There is a weird bug with convergence on Ubuntu where some
# some tasks don't converge on initial puppet run (RBAC definitions,
# pack resource permissions, etc.) so we run it twice.
# Keep in mind that this is an ugly work around because we haven't
# been able to track down the root cause.

# Note: Log file is emptied inside the installer so appending (>>) is fine
echo "Running command: ${COMMAND}"
${COMMAND}

echo "Running command: ${COMMAND}"
${COMMAND}

EXIT_CODE=$?
exit ${EXIT_CODE}
