//Collection
//Array Set Dictionary

//Array ซ้ำกันได้
var a = [3,5,7,9,2,1]
print(a)


//ไม่เก็บตัวซ้ำกัน
var s :Set = [3,5,5,1,9]
print(s)


var fruit = ["Apple","Mango","Coconut","Banana"]
print(fruit)

var data : Set = ["Apple","Mango","Coconut","Apple","Banana","Coconut"]
print(data)

var list : Set = ["Apple","Cherry"]


//หาค่า intersection ที่มีเหมือนกัน
print(data.intersection(list))

var code = ["Dusit" : "10300",
            "Bangna" : "10260",
            "Bangplee" : "10540"]

print(code["Bangna"]!)

let zip = code["Baplee"] ?? "Not Found"
print(zip)

