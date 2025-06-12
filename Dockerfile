# Use slim Python image
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libenchant-2-2 && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy project files into the image
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (Render handles this internally but good practice)
EXPOSE 8000

# Run your app using gunicorn
CMD ["gunicorn", "app:app"]
