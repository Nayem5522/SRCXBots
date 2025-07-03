# Use lightweight Python base image
FROM python:3.10-slim

# Install system dependencies for OpenCV & MuPDF
RUN apt-get update && apt-get install -y \
    libgl1 \
    libxext6 \
    libxrender1 \
    libsm6 \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Start your bot
CMD ["python", "bot.py"]
