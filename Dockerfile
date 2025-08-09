# Usar Python 3.10 compatible con MediaPipe 0.10.x
FROM python:3.10-slim

# Evitar pyc y usar salida sin buffer
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /app

# Instalar dependencias necesarias para MediaPipe y OpenCV
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopencv-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar y renombrar el archivo de requisitos
COPY requerimientos.txt ./requirements.txt

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el proyecto
COPY . .

# Exponer el puerto (ajusta si es diferente)
EXPOSE $PORT

# Comando para iniciar tu servidor
CMD ["python", "servidor_colores.py"]

