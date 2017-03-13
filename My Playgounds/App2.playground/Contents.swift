var x : Int
var y : Double
var s : String
s = "I love you"
var f : Float = 4.86789


x = 5
y = 4.8
x = Int(y)
print(x)

for i in 1..<5 {
    print(i)
}

var i = 1
while i<=3 {
    print("I need you")
    i = i+1
}

//repeat กับ while แทนกันได้
var j = 1
repeat {
    print("I miss you")
    j = j+1
}
while j<=3

//Structure Program Theorem
//Sequence Condotion Herarion

var aa = [3,8,7]
print(aa)

var sales = ["Latte","Mocha","Latte","Espresso"]

for x in aa {
    print(x)
}

for c in sales {
    print(c)
}

var click = ["A","A","B","A","B","B","B"]
var a = 0
var b = 0


for i in click {
    //print(i)
    if i == "A" {a = a+1}
    if i == "B" {b = b+1}
    
}
if a > b {
    print("A มากกว่า")
}
if b > a {
    print("B มากกว่า")
}
if a == b {
    print("A B เท่ากัน")
}

var data = [3,5,4,2,7]
data.sort()
print(data)

//หาค่าเฉลี่ยนใน array
var data2 = [2,3,4,5,6,7]
var a2=0
for i in data2 {
    a2 += i
}
print(a2/2)


//หาค่ามัธยฐานใน array
var data3 = [2,3,4,5,6,7]
var a3 = data3.count
print(a3)
if a3%2==0 {
    var p = data3.count/2
    var sum = data3[p] + data3[p-1]
    print(Double(sum) / 2.0)
    
}else{
    var p = (a3 - 1)/2
    print(data3[p])
}

var score = [7,8,10,9,10]
var sum1 = 0
for i in score {
    sum1 = sum1+i //sum += i
}
score.sort()
print(sum1-score[0] - score[score.count-1])

//ให้หาชื่อคนใน array ว่าตรงกับคนที่ถามหาหรือเปล่า
var list = ["John Smith","Devid Beckham","Blake Lively","Kylie Jenner","Talor Swift"]
var name = "Blake Lively"


//ฟีเควนเชี่ยนเซิส หาทีละตัว
for i in list {
    //print(i)
    if i == name {
        print("Yes! " + i)
    }
}

var found = list.contains("John Smith")
print(found)

//binary search
//list.sort()
//print(list)
//var left = 0
//var found2 = false
//var right = list.count - 1
//while true {
//    var mid = (left + right)/2
//    if name == list[mid] {found = true}
//    if name < list[mid] {right = mid-1;}
//    if name > list[mid] {left = mid+1;}
//    if left >= right || found2 {break;}
//    
//}
//print(found)



//เล่นไพ่สมสิบ
print("ไพ่สมสิบ")
var card = [8,3,4,7,6,5,4]
var target = 15
var found3 = false
for i in 0..<card.count {
    for j in i+1..<card.count {
        if card[i]+card[j] == target{
            found3 = true
        }
    }
}
print(found3)


//หาการ์ดnumberจากตัวเลขที่ต้องการ
var cardnum = [8,3,4,7,15,12,17]
cardnum.sort()
print(cardnum)
var target1 = 16
var found4 = false
var i1 = 0
var j1 = cardnum.count-1

print(cardnum.count)
while true{
    if i1>=j1 {
        break
    }
    if cardnum[i1]+cardnum[j1]==target {
        found4 = true
        break
    }
    if cardnum[i1] + cardnum[j1] < target{
        i1 = i1+1
    }
    if cardnum[i1]+cardnum[j1] > target {
        j1 = j1-1
        
    }
}
print(found4)
//end of code

//ลองดูโค้ด String
var l = "I Love You"
for c in l.characters {
    print(c)
}


//หาว่า D หรือ E มากกว่ากัน
var d:Character = "D"
var e:Character = "E"
var dCount = 0
var eCount = 0


var clicksii = "DEDEDEDEDEDEDEDDEEDEDEEEEDDDEEEEEDDEEDEEEDEEDD"

for n in clicksii.characters {
    //print(n)
    if n == d {
        dCount = dCount+1
    }
    if n==e {
        eCount = eCount+1
    }
}
print(dCount)
print(eCount)
if dCount>eCount {
    print("\(d) มากว่า \(e)")
}
if eCount>dCount {
    print("\(e) มากว่า \(d)")
}
if dCount==eCount {
    print("\(d) เท่ากันกับ \(e)")
}
//end code


var s1 = "racecar"
var x1 = Array(s1.characters)
print(x1)
x1[0] = "f"
var t = String(x1)
print(t)

x1.reverse()
var t1 = String(x1)
print(t1)

var s2 = "gallery"
var t2 = "allergy"

var o = Array(s2.characters)
var m = Array(t2.characters)

o.sort()
m.sort()

var u = String(a)
var v = String(b)

if u == v {
    print("Yes")
}else{
    print("No")
}


























		
