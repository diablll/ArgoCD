# syntax=docker/dockerfile:1

#Download ubuntu from docker hub
FROM ubuntu:latest
# Create a folder inside the home folder in bthe downloaded image
RUN mkdir -p /home/HelloWorld
# Copy the executable fromn this folder to the folder inside the image
COPY . /home/HelloWorld
# Run the application inside the image
CMD /home/HelloWorld/Hello
