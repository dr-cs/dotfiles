#!/usr/bin/env bash

if [ -f requirements.txt ]
then
    echo "Found a requirements.txt file.  Proceeding ..."
    if [ $(grep --count "^pylsp"  requirements.txt) == "0" ]
    then
       echo "requirements.txt does not include pylsp.  Adding ..."
       echo "pyls-memestra" >> requirements.txt
       echo "pylsp-mypy" >> requirements.txt
       echo "pylsp-rope" >> requirements.txt
       echo "python-lsp-black" >> requirements.txt
       echo "python-lsp-isort" >> requirements.txt
       echo "python-lsp-ruff" >> requirements.txt
       echo "python-lsp-server[all]" >> requirements.txt
    fi
else
    echo "No requirements.txt file.  Creating a minimal requirements.txt file containing:"
    echo "ipython"
    echo "matplotlib"
    echo "numpy"
    echo "pandas"
    echo "pyls-memestra"
    echo "pylsp-mypy"
    echo "pylsp-rope"
    echo "python-lsp-black"
    echo "python-lsp-isort"
    echo "python-lsp-ruff"
    echo "python-lsp-server[all]"

    echo "ipython" > requirements.txt
    echo "matplotlib" >> requirements.txt
    echo "numpy" >> requirements.txt
    echo "pandas" >> requirements.txt
    echo "pyls-memestra" >> requirements.txt
    echo "pylsp-mypy" >> requirements.txt
    echo "pylsp-rope" >> requirements.txt
    echo "python-lsp-black" >> requirements.txt
    echo "python-lsp-isort" >> requirements.txt
    echo "python-lsp-ruff" >> requirements.txt
    echo "python-lsp-server[all]" >> requirements.txt
fi


if [ -z "$1" ]
then
    venv_dir="venv"
else
    venv_dir=$1
fi

if [ -f .envrc ]
then
    echo "Found a .envrc file.  Revoking ..."
    direnv revoke
else
    echo "No .envrc file.  Creating ..."
    echo "export VIRTUAL_ENV=$venv_dir" > .envrc
    echo "layout python3" >> .envrc
fi
venv_active=$(python3 -c "import sys; print(sys.prefix != sys.base_prefix, file=sys.stdout)")
if [ $venv_active == "True" ]
then
    echo "venv active.  Deactivating ..."
    deactivate
fi
if [ -f $venv_dir ]
then
    echo "Existing $venv_dir.  Removing ..."
    rm -rf $venv_dir
fi
echo "Creating venv in $venv_dir ..."
python3 -m venv $venv_dir
echo "Activating venv in $venv_dir ..."
source $venv_dir/bin/activate
venv_active=$(python3 -c "import sys; print(sys.prefix != sys.base_prefix, file=sys.stdout)")
echo $venv_active
if [ $venv_active == "True" ]
then
    python3 -m pip install -r requirements.txt
else
    echo "Unable to activate venv in $venv_dir."
fi
# Note: the activation of the venv above is only for this script.
# This direnv command causes the venv to be loaded after the script exits.
direnv allow
