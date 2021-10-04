FROM elyra/kernel-py:2.5.1
USER root
RUN apt-get update && apt-get --yes install apt-utils
RUN apt-get --yes install curl
##RUN apt-get install -y --no-install-recommends freetds-bin krb5-user ldap-utils libffi6 libsasl2-2 libsasl2-modules libssl1.1 locales  lsb-release sasl2-bin sqlite3 unixodbc
# set the user back to original setting
USER $NB_UID
RUN pip install psycopg2-binary
RUN pip install ipykernel
RUN pip install --ignore-installed kubernetes
COPY elyraflownetes-0.7.0-py3-none-any.whl .
RUN pip install --ignore-installed ./elyraflownetes-0.7.0-py3-none-any.whl 
RUN python -m ipykernel install --user --name python_kubernetes
USER root
RUN python -m ipykernel install --name python_kubernetes
USER $NB_UID
ENV THIS_IS_ELYRAFLOW=1
