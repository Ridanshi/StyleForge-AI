FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir \
    torch==2.2.2 torchvision==0.17.2 --index-url https://download.pytorch.org/whl/cpu

COPY requirements.txt .
RUN pip install --no-cache-dir \
    flask flask-wtf flask-bootstrap pillow werkzeug wtforms gunicorn

COPY NST_Code/ ./NST_Code/

WORKDIR /app/NST_Code

EXPOSE 7860

CMD ["python", "app.py"]
