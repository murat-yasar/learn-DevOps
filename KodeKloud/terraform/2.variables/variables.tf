variable "filename" {
   default = "/root/pets.txt"
   type = string
   description = "the path of local file"
}

variable file-content {
   type = map(string)
   default = {
      "statement1" = "We love pets!"
      "statement2" = "We love animals!"
   }
   description = "the content of the file"
}

variable "prefix" {
   default = ["Mr", "Mrs", "Dr"]
   type = list(string)
   description = "the prefix to be set"
}

variable "separator" {
   default = "."
   type = string
}

variable "length" {
   default = 2
   type = number
   description = "the length of the pet name"
}

variable "password_changed" {
   default = false
   type = bool
   description = "has the password been changed"
}
