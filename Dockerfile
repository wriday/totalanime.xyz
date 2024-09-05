FROM python:3.8-slim-buster

# Update and install necessary packages, including ffmpeg
RUN apt update && apt upgrade -y
RUN apt install git ffmpeg -y

# Copy and install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Set up the working directory
RUN mkdir /LazyPrincess
WORKDIR /LazyPrincess

# Copy the startup script
COPY start.sh /start.sh

# Set the default command to run the bot
CMD ["/bin/bash", "/start.sh"]