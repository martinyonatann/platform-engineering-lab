variable "image" {
  description = "Docker image to use"
  type        = string
}

variable "container_name" {
  description = "Docker container name"
  type        = string
}

variable "external_port" {
  description = "Host port exposed by the container"
  type        = number
}


variable "replicas" {
  description = "Number of nginx ontainers to create"
  type        = number
  default     = 1
}
