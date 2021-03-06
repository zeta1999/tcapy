#!/bin/bash

export SCRIPT_FOLDER="$( dirname "$(readlink -f -- "$0")" )"
export SCRIPT_FOLDER="$( dirname "$(readlink -f -- "$SCRIPT_FOLDER")" )"
source $SCRIPT_FOLDER/batch_scripts/linux/installation/set_tcapy_env_vars.sh
source $SCRIPT_FOLDER/batch_scripts/linux/installation/activate_python_environment.sh

echo 'Batch folder' $SCRIPT_FOLDER
echo 'Cuemacro TCAPY' $TCAPY_CUEMACRO

# pytest | tee tcapy_pytest.log

py.test --cov-report term-missing --cov tcapy --verbose | tee pytest.log

# | tee pytest.log

# if we want to run tests for a particular file we can do this
# pytest -v /home/redhat/cuemacro/tcapy/tests/gen/test_tca_functionality.py