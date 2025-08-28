resource "local_file" "pet" {
   filename = var.filename[count.index]
   count = 3
}

resource "local_file" "pet" {
   filename = var.filename[count.index]
   count = length(var.filename)
}

resource "local_file" "pet" {
   filename = each.value
   for_each = toset(var.filename)
}