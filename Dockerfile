# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos necesarios
COPY requirements.txt requirements.txt
COPY . .

# Instala las dependencias
RUN pip install -r requirements.txt

# Expone el puerto en el que correrá la aplicación
EXPOSE 5000

# Define el comando para correr la aplicación
CMD ["python", "app.py"]
