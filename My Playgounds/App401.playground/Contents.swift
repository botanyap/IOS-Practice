
struct Books{
    var title = ""
    var price = 0.0
    func spacialPrice() -> Double {
        return 90.0/100.0 * price
    }
    init(_ title :String,_ price :Double) {
        self.title = title
        self.price = price
    }
}

var p = Books("Biology" ,150)
//p.title = "Physics"
//p.price = 150
var m = Books("Mathematics" ,170)
var q = p

q.title = "Chemistry"

print(q.title)
print(p.title)
//swap(&p, &m)
print(m.spacialPrice())


struct product{
    var name = ""
    var barcode = ""
    var price :Float = 0.0
    func excludeTax() -> Float {
        return price / 1.07
    }
    init(_ n:String ,_ b :String, _ p :Float) {
        name = n
        barcode = b
        price = p
    }
}

//class product2{
//    var barcode = ""
//    var price :Float = 0.0
//    func excludeTax() -> Float {
//        return price / 1.07
//    }
//    init(_ b :String, _ p :Float) {
//        barcode = b
//        price = p
//    }
//}


var p1 = product("กระดาษ Double A 1 รีม","100544",125)
var p11 = product("กรรไกร 3M","100546",180)
//var p2 = product2("100545",150)


swap(&p1, &p11)
print(p1.excludeTax())
print(p11.excludeTax())
//print(p2.excludeTax())

var data  = [
    product("ปริ้นเตอร์ Canon","33451",3500),
    product("ลำโพง JBL","22121",4800)
]

print(data[0])

for d in data {
    print("\(d.name)  \(d.excludeTax())")
}

var list = [
    Books("Physics",150),
    Books("Biology",180),
    Books("Chemistry",140)
]


//หาหนังสือราคาถูกที่สุด
var x = 0
for j in 1...list.count - 1{
    if list[x].price > list[j].price{
        x = j }
}
print("The ceapest book is \(list[x].title)")


//หาค่าเฉลี่ยราคาหนังสือ
var total = 0.0
for b in list {
    total += b.price
}

var average = total / Double(list.count)
print("The average price is \(average)")




