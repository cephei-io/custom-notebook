# Start from a core stack version
FROM quay.io/jupyter/datascience-notebook:python-3.12

# Update some packages
RUN mamba update pexpect jupyterlab jupyterlab-git --yes 

# Install tensorflow (CPU only)
RUN mamba install --quiet --yes tensorflow-cpu

# Install Database packages
RUN mamba install --quiet --yes pymongo PyMySQL

# Install plotly[express]
RUN mamba install --quiet --yes plotly[express]

# Cleanup and fix permissions
RUN mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
    
