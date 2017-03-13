
func show(_ count : Int){
    for _ in 1...count {
        
        print("I Love You")
    }
}

show(5)


class Books {
    var title : String = ""
    var price : Double = 0.0
}

var b = Books()
b.title = "Bioligy"
b.price = 120
print(b.title)

class Shirt{
    var size : Character = " "
    var price : Double = 0.0
    func spacialPrice() -> Double {
        //ลด 10%
        return 90.0/100.0 * price
    }
}

//สร้างinstance
var s = Shirt()
s.size = "S"
s.price = 180
s.spacialPrice()
print(s.spacialPrice())


class Students{
    var code : String = ""
    var name :String = ""
    var score = 0.0
    func show() {
        print("\(code) - \(name) - \(score)")
    }
}

var s1 = Students()
s1.code = "Fx8754"
s1.name = "Tanya"
s1.score = 95.5
print(s1.name)
s1.show()


class Circle{
    var radius : Double = 0.0
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    init(radius :Double) {
        self.radius = radius
    }
}
var c = Circle(radius:5)
//c.radius = 5.5
print(c.area())


class Ellipse{
    var major:Double = 0.0
    var minor:Double = 0.0
    
    init(_ m:Double,_ n:Double) {
        self.major = m
        self.minor = n
    }
    func area() -> Double {
        return Double.pi/4 * major * minor
    }
}

var el = Ellipse(8,5)
print(el.area())


//หาพื้นที่สี่เหลี่ยนจัตุรัส
class Sqare{
    var width = 0.0
    
    init(_ w :Double) {
        self.width = w
    }
    func area() -> Double {
        return width * width
    }
}

var s2 = Sqare(4)
print(s2.area())

//หาพื้นที่สี่เหลี่ยมผืนผ้า
class Rectangle{
    var width : Double = 0.0
    var height : Double = 0.0
    
    init(_ w :Double ,_ h :Double) {
        width = w
        height = h
    }
    func area() -> Double {
        return width * height
    }
}


var re = Rectangle(4,5)
print(re.area())

//หา sqare จาก Rectangle

class Sqare2 : Rectangle{
    init(_ x :Double) {
        super.init(x, x)
    }
}

var s3 = Sqare2(4)
print(s3.area())

class Ellipse2{
    var major:Double = 0.0
    var minor:Double = 0.0
    
    init(_ m:Double,_ n:Double) {
        self.major = m
        self.minor = n
    }
    func area() -> Double {
        return Double.pi * major * minor
    }
    
}

class Circle2 : Ellipse2 {
    init(_ r :Double) {
        super.init(r, r)
    }
}

var cr = Circle2(4)
print(cr.area())









		