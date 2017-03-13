import Foundation
//Stuct กับ class ไม่เหมือนกัน
//var s = "Hello"

prefix func - (_ s: String ) -> String {
    var c = s.characters
    c.removeFirst()
    return String(c)
}
print(-"I Love you")

prefix func + (_ s: String ) -> String {
 return s+s
}

print(+"Love")

postfix operator %
postfix func %(_ n :Int) -> Double {
    return Double(n) / 100.0
}

print(7%)


postfix func -- (_ s: String)-> String{
    var v = s.characters
    v.removeFirst()
    return String(v)
}

func ^(_ a: Double ,_ b : Double) -> Double {
   return pow( a , b)
}
print(2.0 ^ 5.0)

//ปริ้น string ตามจำนวนที่คูณเข้าไป
infix operator *
func * (_ s : String , _ c : Int ) -> String
{
    var result = " "
    for _ in 1...c {
        result += s
    }
    
    return result
}

print("love " * 3)

func < (_ s : String , _ c : Int ) -> String{
    var v = s.characters
    while v.count > c {
        v.removeLast()
    }
    return String(v)
}
print("I Love You" < 7)

infix operator <->
func <-> (_ a :inout Int , _ b : inout Int){
    let t = a
    a = b
    b = t
}

var a = 7
var b = 5
 a <-> b
print(a)




//เล่นกับ 
protocol Taxable {
    func total() -> Double
}


class Product{
    var code = ""
    var price = 0.0
    
}

class Books : Product{
    var title = ""
    func total() -> Double {
        return 1.07 * price
    }
    func shippingCost() -> Double{
        return 100
    }
}

var g  = Books()
g.code = "123443345"
g.title = "Biology"
g.price = 120.0

print(g.total())

protocol Shippable {
    func shippingCost() -> Double
}

class Equipment : Product,Shippable {
    func shippingCost() -> Double {
        return 200
    }
}


