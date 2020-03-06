FROM python:3.7

RUN pip3 install tornado

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

EXPOSE 8888

COPY --chown=jovyan:jovyan tornadoapp.py /home/jovyan
COPY --chown=jovyan:jovyan jupyterhub-singleuser /usr/bin

CMD ["jupyterhub-singleuser"]

