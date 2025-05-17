# Start from a core stack version
FROM jupyter/datascience-notebook:latest

# Update some packages
RUN mamba update pexpect jupyterlab jupyterlab-git --yes 

# Install tensorflow
RUN mamba install --quiet --yes tensorflow

# Install Database packages
RUN mamba install --quiet --yes pymongo PyMySQL

# Cleanup and fix permissions
RUN mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
    
