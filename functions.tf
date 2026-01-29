output "max-num" {
    value = max(4 ,5, 10)
  
}

output "upper" {
    value = upper("hello world")
  
}
output "joined" {
    value = join("-", ["hello", "world", "from", "terraform"])
  
}

variable "list1" {
    default = ["apple", "banana", "cherry"]
    type = list(string)
  
}
output "secondItem" {
    value = var.list1[1]
  
}
variable "set1" {
    default = ["red", "blue", "green", "blue", "red"]
    type = set(string)
     
}
output "set1out" {
    value = var.set1
  
}
output "seconditemofset1" {
    value = tolist(var.set1)[1]
  
}