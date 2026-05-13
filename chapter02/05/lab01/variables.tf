variable "service_port" {
  type = number
  default = 80

  validation {
    condition = 1 <= var.service_port && var.service_port <= 65535
    error_message = "service_port는 1~65535 값이어야 합니다."
  }
}

variable "cidr_blocks" {
  type = list(string)
  default = ["192.168.0.0/16"]    # default로 박아놔야지 plan이나 apply 할때 안물어봄.

  validation {
    condition = length(var.cidr_blocks) > 0
    error_message = "cidr_blocks 최소 1개 이상 CIDR을 포함해야 합니다."
  }

}



variable "instance_type" {
  type = string
  default = "t3.micro"

  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "인스턴스 타입을 골라야함."
  }

}