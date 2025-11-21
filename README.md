📘 Proyecto PHP Clima – Docker + Kubernetes

Aplicación web sencilla en PHP que consulta información meteorológica desde la API pública de Open-Meteo, se ejecuta dentro de un contenedor Docker y se despliega en un clúster local de Kubernetes usando Docker Desktop en Windows.

Este README explica cómo reproducir el proyecto desde cero en un entorno Windows 10/11.

🔧 1. Requisitos del Entorno

Antes de iniciar, asegúrese de contar con lo siguiente:

Windows 10/11 Pro o Enterprise

Docker Desktop instalado y en ejecución
(el ícono de la ballena debe mostrarse activo)

Kubernetes habilitado dentro de Docker Desktop
Settings → Kubernetes → Enable Kubernetes

PowerShell (Windows PowerShell o PowerShell 7)

Archivos del proyecto:

index.php

Dockerfile

k8s-deployment.yaml


📂 2. Preparación del Proyecto

Cree una carpeta para el proyecto, por ejemplo:

C:\Proyectos\php-clima-k8s


Copie dentro de esa carpeta los tres archivos proporcionados:

index.php

Dockerfile

k8s-deployment.yaml

Desde PowerShell, ubíquese dentro de la carpeta:

cd C:\Proyectos\php-clima-k8s

🐳 3. Construcción de la Imagen Docker

Con Docker Desktop ejecutándose, construya la imagen usando:

docker build -t php-clima-api:v1 .


Nota: El punto (.) indica que el contexto de construcción es la carpeta actual.

Para una prueba rápida local, puede ejecutar el contenedor:

docker run -d -p 8080:80 --name clima-test php-clima-api:v1


Y después abrir: http://localhost:8080

☸️ 4. Despliegue en Kubernetes

Con Kubernetes habilitado en Docker Desktop, aplique el manifiesto:

kubectl apply -f k8s-deployment.yaml


Este archivo crea:

Un Deployment con una réplica del contenedor

Un Service de tipo NodePort para exponerlo públicamente

🔎 5. Verificación del Despliegue
Verificar que el pod está ejecutándose:
kubectl get pods


Debe aparecer un pod con estado Running.

Verificar el servicio y su NodePort:
kubectl get service php-clima-service


Debe verse un puerto similar a:

80:30080/TCP


El número a la derecha (30080) es el puerto de acceso.

🌐 6. Acceso a la Aplicación

Una vez desplegado, ingrese en el navegador:

http://localhost:30080


Si en el manifiesto cambió el NodePort, utilice ese puerto.

🧹 7. Eliminación de Recursos (Opcional)

Para borrar el Deployment y el Service:

kubectl delete -f k8s-deployment.yaml


Si desea borrar la imagen local:

docker rmi php-clima-api:v1

✔️ 8. Contenido del Proyecto

La carpeta final debe incluir:

php-clima-k8s/
 ├─ index.php
 ├─ Dockerfile
 └─ k8s-deployment.yaml
