# Use a slim Python image for a smaller footprint
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Install dependencies first to leverage Docker layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port defined in your app.run()
EXPOSE 7000

# Use Gunicorn for production instead of the Flask dev server
# We bind it to port 7000 to match your Python code
CMD ["gunicorn", "--bind", "0.0.0.0:7000", "app:app"]
