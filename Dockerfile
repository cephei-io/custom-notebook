# Start from a core stack version
FROM jupyter/datascience-notebook:latest

# install a package into the default environment and cleanup after the installation
RUN mamba install --quiet --yes flake8 pymongo tensorflow jupyterlab jupyterlab-git && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
