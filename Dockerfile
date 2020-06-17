FROM centos:7

# install python and pip
RUN yum install -y epel-release
RUN yum install -y python36-devel python36-pip

# install our pacakges
RUN pip3 install --user jupyterlab kaggle pandas scikit-learn xgboost 
# turns out xgboost needs this
RUN yum install -y libgomp

# create a user to run jupyterlab
RUN adduser jupyter

# switch to our user and their home dir
USER jupyter
WORKDIR /home/jupyter

# tell docker to listen on port 8888 and run jupyterlab
EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888"]
