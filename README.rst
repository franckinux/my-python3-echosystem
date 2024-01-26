Indroduction
============

System packages are unchanged.

Python packages used for developping are common to all projects, they are
installed in the user workspace (`~/.local/lib/python3.10/site-packages`).

Python packages used for the user application are installed in the local
workspace (`<application-directory-name>/.venv/lib/python3.10/site-packages`).

Installation
============

Copy the file `cd.sh` in th home directory.

Add the following lines to the `.bashrc` file:

.. code-block:: console

    source ~/cd.sh
    export PIP_REQUIRE_VIRTUALENV=false
    export PIP_USER=true
    export PYTHONPATH=''

Install the following packages:

.. code-block:: console

    sudo apt install graphiz
    sudo apt install enscript psutils

Python development packages
===========================

They are installed in the user work space:

.. code-block:: console

    pip3 install -r requirements.txt

Application environment creation
================================

In the application directory, copy the files `doc8.ini`, `mypy.ini`, `.enter.sh`
and `.exit.sh`.

Create a Python virtual environment:

.. code-block:: console

    pip3 -m venv .venv --prompt <application-name> --upgrade-deps --system-site-packages
    cd .

Python packages for the application
===================================

They are places in the local workspace (virtualenv):

.. code-block:: console

    pip install <package-name>

To overwrite any existing package in the system or user work area:

.. code-block:: console

    pip install --upgrade --force-reinstall <package-name>

Install git hooks for pre-commit
================================

In the working area :

.. code-block:: console

    pre-commit install

Dependencies management
=======================

Make a graph of packages installed in the local working area:

.. code-block:: console

    pipdeptree --graph-output png > dependencies.png

Generate the application's requirements file
--------------------------------------------

.. code-block:: console

    pip3 freeze --local > requireements.txt

Upgrade the application Python packages
---------------------------------------

.. code-block:: console

   ./utils/pip-upgrade-packages

Remove Python package and its dependencies
------------------------------------------

.. code-block:: console

   pip-autoremove <package-name> -y
