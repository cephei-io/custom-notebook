# Start from a core stack version
FROM jupyter/datascience-notebook:latest

# Install additional packages
RUN mamba install --quiet --yes pymongo tensorflow

# Update all packages
RUN mamba update --all --quiet --yes && mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
    
