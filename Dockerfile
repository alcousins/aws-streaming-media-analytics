#FROM lambci/lambda:build-nodejs14.x
FROM public.ecr.aws/lambda/nodejs:14
WORKDIR /tmp

ENV AWS_EXECUTION_ENV=AWS_Lambda_python3.8 \
    PYTHONPATH=/var/runtime

#install python dependencies
#RUN python3 --version
RUN yum install python3 tar gzip -y
RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python3.7 && \
  pip install -U pip setuptools --no-cache-dir && \
  pip install -U virtualenv pipenv --no-cache-dir && \
  curl https://lambci.s3.amazonaws.com/fs/python3.8.tgz | tar -zx -C /

WORKDIR /build

ENTRYPOINT ["/bin/bash", "-l", "-c"]

