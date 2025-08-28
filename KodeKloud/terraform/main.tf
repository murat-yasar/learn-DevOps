resource "local_file" "pet" {
   filename = "/root/pets.txt"
   content = "we love pets!"
}

resource "local_file" "cat" {
   filename = "/root/cat.txt"
   content = "My favourite pet is my cat!"
}

resource "local_file" "my-cat" {
   filename = "/root/my-cat"
   content = "My cat's name is kitty!"
}

resource "random_pet" "other-pet" {
    length = "1"
    prefix = "Mr"
    separator = "."
}