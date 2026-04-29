# Imagen API
resource "docker_image" "api" {
  name = "lab/api:latest"
}

# Contenedor API
resource "docker_container" "api" {
  name  = "api01"
  image = docker_image.api.name

  ports {
    internal = 8080
    external = var.api_port[terraform.workspace]
  }
}

# Imagen WEB
resource "docker_image" "web01" {
  name = "web01:latest"
}

# Contenedor WEB
resource "docker_container" "web01" {
  name  = "web01"
  image = docker_image.web01.name

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}


# Imagen BD POSTGRESQL
resource "docker_image" "POSTGRESQL" {
  name = "postgres:15.17"
}

# Contenedor BD POSTGRESQL
resource "docker_container" "POSTGRESQL" {
  name  = "postgresql"
  image = docker_image.POSTGRESQL.name

  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }
   env = [
    "POSTGRES_USER=admin",
    "POSTGRES_DB=appdb",
    "POSTGRES_PASSWORD=admin123",
    ]
}