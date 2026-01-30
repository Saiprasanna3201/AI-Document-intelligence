# Use Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all files to container
COPY . .

# Install required packages (if any)
RUN pip install --no-cache-dir PyPDF2 pytesseract pillow

# Run the application
CMD ["python", "chatwithdoc.py"]
