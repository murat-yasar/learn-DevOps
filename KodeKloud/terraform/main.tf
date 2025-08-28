resource "local_file" "pet" {
   filename = "/root/pets.txt"
   content = "we love pets!"
}

resource "local_file" "cat" {
   filename = "/root/cat.txt"
   content = "My favourite pet is my cat!"
}