resource "local_file" "my-cat" {
   filename = "/root/my-cat"
   content = "My cat's name is kitty!"
}

resource "random_pet" "other-pet" {
    length = "1"
    prefix = "Mr"
    separator = "."
}