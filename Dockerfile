# use the miniforge base, make sure you specify a verion
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-osx-64.lock /tmp/conda-linux-64.lock

RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
	&& mamba clean --all -y -f \
	&& fix-permissions "${CONDA_DIR}" \
	&& fix-permissions "/home/${NB_USER}"