# Start from a core stack version
FROM jupyter/datascience-notebook:latest

# Install additional packages
RUN mamba install --quiet --yes pymongo tensorflow

# Install mysql client
# sudo apt-get install python3-dev default-libmysqlclient-dev build-essential pkg-config
RUN apt-get -y install mariadb-client
RUN mamba install --quiet --yes mysqlclient

# Update all packages
RUN mamba update pexpect jupyterlab jupyterlab-git --yes && mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
    
