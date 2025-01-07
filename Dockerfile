# Stage 1: Builder
FROM python:3.9-alpine AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Install build dependencies
RUN apk add --no-cache \
    postgresql-dev \
    gcc \
    python3-dev \
    musl-dev

# Create and activate virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime
FROM python:3.9-alpine AS runtime

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/opt/venv/bin:$PATH"

# Install only the necessary runtime dependencies
RUN apk add --no-cache libpq

# Copy virtual environment from builder
COPY --from=builder /opt/venv /opt/venv

# Copy only necessary project files
COPY manage.py .
COPY easyschool/ ./easyschool/
COPY students/ ./students/
COPY teachers/ ./teachers/
COPY course/ ./course/
COPY templates/ ./templates/

# Create a non-root user
RUN adduser -D appuser && \
    chown -R appuser:appuser /app
USER appuser

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]