🚀 Despliegue de Azure Container Apps con Terraform

Este repositorio contiene la infraestructura como código (IaC) para desplegar una aplicación basada en contenedores Docker sobre Azure Container Apps, cumpliendo con los requisitos del Diploma DevOps Engineer (v.2025B.2).

La infraestructura es aprovisionada 100% con Terraform, usando buenas prácticas de:

modularidad

variables

nomenclatura clara

control de versiones en Git

🏗️ Arquitectura desplegada

La solución crea los siguientes recursos en Azure:

Resource Group

Log Analytics Workspace

Container Apps Environment

Azure Container App (con autoscaling)

Ingress público HTTP

📦 La aplicación se despliega desde DockerHub.

🐳 Imagen Docker utilizada
docker.io/cadriannavarrete/navarrete-hola:1.0


⚠️ Importante: el tag latest no existe, por eso se usa 1.0.

📁 Estructura del proyecto
terraform-despliegue/
├── main.tf
├── providers.tf
├── variables.tf
├── locals.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars
├── .gitignore
└── README.md

🔤 Convención de nombres

Los recursos siguen esta nomenclatura:

<tipo>-<owner>-<proyecto>-<ambiente>-<region>


Ejemplo:

rg-adrian-navarrete-dev-westus2
ca-adrian-navarrete-dev-westus2


Esto permite identificar fácilmente:

quién lo creó

para qué proyecto

en qué ambiente

en qué región

⚙️ Variables principales

Las variables se definen en variables.tf y se asignan en terraform.tfvars.

Ejemplo (terraform.tfvars):

subscription_id = "SECRET"
location        = "westus2"

project     = "navarrete"
environment = "dev"

container_image = "docker.io/cadriannavarrete/navarrete-hola:1.0"
container_port  = 80

▶️ Cómo ejecutar el despliegue
1️⃣ Iniciar sesión en Azure
az login
az account set --subscription SECRET

2️⃣ Inicializar Terraform
terraform init

3️⃣ Validar configuración
terraform validate

4️⃣ Ver el plan
terraform plan

5️⃣ Aplicar infraestructura
terraform apply


Escribir yes cuando Terraform lo solicite.

🌐 Obtener la URL de la aplicación

Al finalizar el despliegue:

terraform output container_app_url


Abrir la URL en el navegador para acceder a la aplicación.

📌 Notas importantes

La suscripción debe tener registrado el provider:

Microsoft.App

El repositorio DockerHub debe ser público o configurarse con credenciales.

No se versiona el archivo terraform.tfstate (está en .gitignore).

🧪 Estado del proyecto

 Infraestructura desplegada con Terraform

 Uso de variables y .tfvars

 Imagen Docker desde DockerHub

 Repositorio público en Git

 Nomenclatura clara y profesional

👨‍💻 Autor

Carlos Adrian Navarrete Ramirez
Diploma DevOps Engineer – 2026