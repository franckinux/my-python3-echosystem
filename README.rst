Indroduction
============

System packages are unchanged.

Python packages used for developping are installed in the user workspace
(`~/.local/lib/python3.10/site-packages`). In the console where I edite the
files, I don't activate the Python virtual environment. This enables to have the
benefits of the language python server. For the installation see `Python
development packages`_.

Python packages used for the user application are installed in the local
workspace (`<application-directory-name>/.venv/lib/python<python
version>/site-packages`). In the console where I execute the Python program, I
create a Python virtual environment where I install the application dependencies
only.

Installation
============

Copy the file `cd.sh` in the home directory.

Add the following lines to the `.bashrc` file:

.. code-block:: console

    source ~/cd.sh

Install the following packages:

.. code-block:: console

    sudo apt install graphiz
    sudo apt install enscript psutils

Python development packages
===========================

They are installed in the user work space:

.. code-block:: console

    python3 install --user -r requirements.txt

where the `requirements.txt` file is the one in this repository.

Application environment creation
================================

In the application directory, copy the files `doc8.ini`, `mypy.ini`, `.enter.sh`,
`.exit.sh`, `.pydeps` and `.pre-commit-config.yaml`.

Create a Python virtual environment:

.. code-block:: console

    pip3 -m venv .venv --prompt <application-name> --upgrade-deps --break-system-packages
    cd .

Python packages for the application
===================================

Prior to manage packages in the application's space, the virtual environement
have to be activated :

.. code-block:: console

   cd <application directory>
   # if you have adopted the cd.sh / .enter.sh technique
   cd .
   # or
   source .venv/bin/activate

They are installed in the local workspace (virtualenv):

.. code-block:: console

    # if the requitements.txt file does not exit yet
    pip install <package-name>
    # or
    pip install -r <requirements-file>


where the `requirements.txt` file comes fromethe application's reository, not
the one in this repository.

To overwrite any existing package in the system or user work area:

.. code-block:: console

    pip install --upgrade --force-reinstall <package-name>

To generate a requirement file:

.. code-block:: console

    pip freeze --local <requirements-file> > requirements.txt

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

    pip3 freeze --local > requirements.txt

Upgrade the application Python packages
---------------------------------------

.. code-block:: console

   ./utils/pip-upgrade-packages

Remove Python package and its dependencies
------------------------------------------

.. code-block:: console

   pip-autoremove <package-name> -y
