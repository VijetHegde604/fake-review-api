# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt /app/

# Install the Python dependencies
RUN apt-get update && apt-get install -y libgomp1

RUN pip install --no-cache-dir -r requirements.txt

RUN python -m spacy download en_core_web_sm

# Copy the Flask application code
COPY . /app/

# Expose the port the app will run on
EXPOSE 5000

# Set the command to run the Flask app
CMD ["python", "app.py"]