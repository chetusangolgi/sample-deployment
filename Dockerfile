FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1
ENV HTTP_HOST="0.0.0.0"
ENV HTTP_PORT=5006
ENV UDP_HOST="0.0.0.0"  
ENV UDP_PORT=5005
# Add these new environment variables
ENV UDP_BUFFER_SIZE=65507  
ENV UDP_TIMEOUT=1.0
ENV MQTT_BROKER='192.168.1.98'
ENV MQTT_PORT=1883
ENV TRANSCRIPTION_INTERVAL=3
ENV AUDIO_CHUNKS_DIR="audio_chunks"
ENV OUTPUT_AUDIO_DIR="output_audio"
ENV ELEVENLABS_API_KEY=sk_7bbbc42db83364614c2e07da3991c16a91256df9e7281f37

EXPOSE 5006
EXPOSE 5005/udp
EXPOSE 1883

COPY . .

CMD ["python", "app.py"]
