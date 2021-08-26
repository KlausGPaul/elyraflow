FROM elyra/kernel-py:2.5.1
USER root
##RUN apt-get update && apt-get --yes install apt-utils
##RUN apt-get --yes install curl
##RUN apt-get install -y --no-install-recommends freetds-bin krb5-user ldap-utils libffi6 libsasl2-2 libsasl2-modules libssl1.1 locales  lsb-release sasl2-bin sqlite3 unixodbc
# set the user back to original setting
USER $NB_UID
COPY install_airflow.sh .
RUN ./install_airflow.sh .
RUN pip install 'apache-airflow-providers-postgres'
RUN pip install 'apache-airflow-providers-amazon'
RUN pip install 'apache-airflow-providers-ftp'
RUN pip install 'apache-airflow-providers-http'
RUN pip install 'apache-airflow-providers-microsoft-azure'
RUN pip install 'apache-airflow-providers-sftp'
RUN pip install 'apache-airflow-providers-slack'
RUN pip install 'apache-airflow-providers-ssh'
RUN pip install 'apache-airflow-providers-tableau'
RUN pip install airflow-notebook
RUN pip install geopandas
RUN pip install psycopg2-binary
RUN pip install ipykernel
RUN python -m ipykernel install --user --name python_kubernetes
USER root
RUN python -m ipykernel install --name python_kubernetes
USER $NB_UID
