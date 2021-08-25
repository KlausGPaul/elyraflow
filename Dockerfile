FROM elyra/kernel-py:2.5.1
USER root
RUN apt-get update && apt-get --yes install apt-utils
RUN apt-get --yes install curl
# set the user back to original setting
USER $NB_UID
RUN pip install geopandas
RUN pip install psycopg2-binary
COPY install_airflow.sh .
#ENV AIRFLOW_VERSION=2.1.3
#RUN export PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
#RUN export PYTHON_VERSION="$(./python_version.sh)" && echo $PYTHON_VERSION
#RUN export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" && echo $CONSTRAINT_URL
#RUN pip install "apache-airflow[ftp,postgres,sftp,http,amazon,microsoft-azure,slack,tableau]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
#RUN export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" && pip install "apache-airflow[ftp,postgres,sftp,http,amazon,microsoft-azure,slack,tableau]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
RUN ./install_airflow.sh .
RUN python -m ipykernel install --user --name python_kubernetes
USER root
RUN python -m ipykernel install --name python_kubernetes
USER $NB_UID
