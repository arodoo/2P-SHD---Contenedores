# Servicio REST API de Predicción

Este proyecto es un servicio REST API que simula el uso de un modelo de predicción. Está configurado y desplegado mediante el uso de contenedores Docker.

## Información del Servicio

El servicio proporciona dos endpoints principales:
- `/`: Muestra un mensaje de bienvenida.
- `/predict`: Simula una predicción y devuelve un resultado en formato JSON.

## Requerimientos

- Python 3.9 o superior
- Docker
- Docker Compose

## Instalación

### Paso 1: Clonar el Repositorio

```bash
git clone <URL del repositorio>
cd <nombre-del-repositorio>
```
### Paso 2: Crear el Archivo requirements.txt
Crea un archivo llamado requirements.txt en el directorio del proyecto con el siguiente contenido:

```bash
Flask==2.0.1
Werkzeug==2.2.2
```

### Paso 3: Crear el Archivo Dockerfile
Crea un archivo llamado Dockerfile en el directorio del proyecto con el siguiente contenido:

```bash
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
```

### Paso 4: Crear el Archivo docker-compose.yml
Crea un archivo llamado docker-compose.yml en el directorio del proyecto con el siguiente contenido:

```bash
version: '3'
services:
  web:
    build: .
    ports:
      - "5000:5000"
```

## Uso
### Producción
Para ejecutar el servicio en un entorno de producción, sigue estos pasos:

Construir y ejecutar los contenedores:
```bash
docker-compose up --build -d
```
Acceder a los Endpoints:
Endpoint /:
```bash
curl http://127.0.0.1:5000/

```
Respuesta esperada:
```bash
Bienvenido a mi API de predicción!
```

Endpoint /predict:

```bash
curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' http://127.0.0.1:5000/predict
```

Respuesta esperada:
```bash
{
  "prediction": true
}
```
## Desarrollo

Para ejecutar el servicio en un entorno de desarrollo, sigue estos pasos:

### Instalar las dependencias:

Copiar código
```bash
`pip install -r requirements.txt`
```
### Ejecutar la aplicación:

```bash
`python app.py`
```

## Acceder a los Endpoints:

### Endpoint `/`:
```bash
`curl http://127.0.0.1:5000/`
```
**Respuesta esperada:**

`Bienvenido a mi API de predicción! Te habla Arodi desde la UTCV`

### Endpoint `/predict`:

```bash

`curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' http://127.0.0.1:5000/predict`
```
**Respuesta esperada:**

json

`{
  "prediction": true
}`
