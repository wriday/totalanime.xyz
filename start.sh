#!/bin/bash

# Install ffmpeg
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg not found, installing..."
    apt update && apt install -y ffmpeg
else
    echo "ffmpeg is already installed"
fi

# Clone the repository
if [ -z $UPSTREAM_REPO ]
then
  echo "Cloning main Repository"
  git clone https://github.com/lazyindu/test1.git /LazyPrincess
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone $UPSTREAM_REPO /LazyPrincess
fi

# Change directory to the cloned repo
cd /LazyPrincess

# Install Python dependencies
pip3 install -U -r requirements.txt

# Start the bot
echo "Starting Bot...."
python3 bot.py