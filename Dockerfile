FROM python:3.13.5-alpine3.22

WORKDIR /app

COPY requirements.txt .
RUN apk add --no-cache --virtual .build-deps \
    build-base \
    python3-dev \
    linux-headers \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps

COPY . .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]