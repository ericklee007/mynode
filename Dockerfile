1.Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.7.4-slim

# Set the working directory to /app
WORKDIR /app

# Copy the file from host into the current filesystem at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME Luna

# Run app.py when the container launches
CMD ["python", "app.py"]

2.build
# make sure you are in your project folder
cd docker-demo

# create an image and name it as docker-demo-image
docker build --tag=docker-demo-image .

# build the image with custom tag
# syntax --tag=<image-name>:<image-tag>
docker build --tag=docker-demo-image:v1.0 .



3.tag
# make sure you are in your project folder
cd docker-demo

# create an image and name it as docker-demo-image
docker build --tag=docker-demo-image .

# build the image with custom tag
# syntax --tag=<image-name>:<image-tag>
docker build --tag=docker-demo-image:v1.0 .

4.Push Local Image to Docker Hub
# this won't work
docker push docker-demo-image:v2.0

# rename the image
docker tag docker-demo-image lunawen/docker-demo-image

# re-push
docker push lunawen/docker-demo-image
   
5.Pull Image From Docker Hub
# we are using port 4001 now to run the project, just in case you didn't stop the previous container.
docker run -d -p 4001:80 lunawen/docker-demo-image

# check containers
docker container ls -a
