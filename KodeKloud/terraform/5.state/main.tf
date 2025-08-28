resource "local_file" "pet" {
   filename = "/root/pet.txt"
   content = "My favourite pet is ${random_pet.my-pet.id}!"
}

resource "random_pet" "my-pet" {
   length = 1
}

resource "local_file" "cat" {
   filename = "/root/cat.txt"
   content = "I like cats too!"
}