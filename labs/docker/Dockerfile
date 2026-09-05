# =============================================================================
# THIS DOCKERFILE IS DELIBERATELY BAD.
#
# It works. It builds. It runs. It is also slow, huge, and insecure.
# Find every problem, then rewrite it as Dockerfile.fixed
# =============================================================================

# We get the image
FROM python:3.12

WORKDIR /app

# RUN happens when we build the image
# System packages
RUN apt-get update
RUN apt-get install -y curl
# Why do we need vim?
RUN apt-get install -y vim
RUN apt-get install -y build-essential

# Copy the dependencies manifest
RUN pip install -r app/requirements.txt
COPY requirements.txt .

# Copy the rest of our app into the container
# Need to add a docker ignore to not copy the package file, since that is a heavy file
COPY app/ ./app./

# Metadata
ENV APP_VERSION=1.0.0

EXPOSE 8080

# Run commands when we start the container
# How it starts
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app.main:app"]

