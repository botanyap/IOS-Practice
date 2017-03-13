import Foundation

var a = [1,3,4,2]
a.sort()
print(a)

class Book {
    var title = ""
    var price = 0.0
    init(_ t : String, _ p :Double) {
        title = t
        price = p
    }
}

var b = Book("Biology",120)
var c = Book("Chemistry",120)
var list = [
    Book("Biology" ,120),
    Book("Mathematics" ,110),
    Book("Physics" ,130)
]

//list.sort()
for b in list {
    print(b.title)
}

//Equatable เปรียบเทียบการเท่ากัน
class Books : Equatable {
    var title = ""
    var price = 0.0
    init(_ t : String, _ p :Double) {
        title = t
        price = p
    }
    static func == (left : Books , right : Books) -> Bool {
        if left.price == right.price {
            return true
        }else{ return false }
    }
    static func < (left : Books , right : Books) -> Bool {
        if left.price < right.price {
            return true
        }else{ return false }
    }
    static func <= (left : Books , right : Books) -> Bool {
        if left.price <= right.price {
            return true
        }else{ return false }
    }
    static func > (left : Books , right : Books) -> Bool {
        if left.price >= right.price {
            return true
        }else{ return false }
    }
}

class Tools : Comparable {
    var name = ""
    var price = 0.0
    
    init(_ n : String, _ p :Double) {
        name = n
        price = p
    }
    static func == (left : Tools , right : Tools) -> Bool {
        if left.price == right.price {
            return true
        }else{ return false }
    }
    static func < (left : Tools , right : Tools) -> Bool {
        if left.price < right.price {
            return true
        }else{ return false }
    }
    static func <= (left : Tools , right : Tools) -> Bool {
        if left.price <= right.price {
            return true
        }else{ return false }
    }
    static func > (left : Tools , right : Tools) -> Bool {
        if left.price >= right.price {
            return true
        }else{ return false }
    }
}

var data = [Tools("Screw Driver",220),
Tools("Sand Paper",20)]
data.sort()
for d in data {
    print(d.name)
}


//

class ComplexNumber : Equatable {
    var real : Double = 0.0
    var imagin : Double = 0.0
    
    init(_ r : Double, _ i :Double) {
        real = r
        imagin = i
    }
    static func == (left : ComplexNumber , right : ComplexNumber) -> Bool {
        return left.real == right.real && left.imagin == right.imagin
    }
}

var z1 = ComplexNumber(3.0 / 2.0 , 5.0)
var z2 = ComplexNumber(1.5 ,5)

print(z1 == z2)

func love(){
    print("I Love You")
}

love()


//func ยากๆ
func show(number count : Int) {
    for _ in 1...count {
        print("I miss you")
    }
}
show(number: 3)

func work(_ count : Int){
    for _ in 1...count {
        print("I need you")
    }
}
work(3)

var x = 80.0

//extension Double {
//    func half() -> Double {
//        return self/2
//    }
//    var middl = Double {
//        return self/2
//    }
//}
//
//print(x.half())
//print(x.middle)




//เพิ่มfunc ให้กับ String
extension String{
    //เอาตัวข้างหลังมาต่อข้างหน้า
    func reverse() -> String {
        var w = self.characters
        var r  = ""
        
        for i in w {
            r = String(i) + r
        }
        return r
    }
}

var s = "hello"
print(s.reverse())

extension String{
    //เอาช่องว่างออกจาก String
    func trim() -> String {
        let components = self.components(separatedBy: .whitespaces)
        return components.joined(separator: "")
    }
    
    func trimm() -> String {
        var c = self.characters
        while c[0] == " " {
            c.removeFirst()
        }
        
    }
}

print("I love You ".trim())

