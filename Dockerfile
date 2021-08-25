FROM elyra/kernel-py:2.5.1
USER root
RUN apt-get update && apt-get --yes install apt-utils
RUN apt-get --yes install curl
# set the user back to original setting
USER $NB_UID
RUN pip install geopandas
RUN pip install psycopg2-binary
RUN pip install apache-airflow
RUN python -m ipykernel install --user --name python_kubernetes
USER root
RUN python -m ipykernel install --name python_kubernetes
USER $NB_UID
