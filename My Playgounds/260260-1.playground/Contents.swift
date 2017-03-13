
var l : Double! = 2.5

enum Direction {
    case north
    case east
    case south
    case west
}

var x :Direction = Direction.east
print(x)

var y : Direction = Direction.west
print(y)

enum Day {
    case Sunday, Monday ,Tuesday, Wenesday ,
    Thursday , Friday , Saturday
    
}

var a = Day.Friday
print(a)

enum NumberError : Error {
    case invalid
    case overflow
}

func parse(_ s : String) throws -> Double {
    if let z = Double(s) {
        return z
    }else{
        throw NumberError.invalid
    }
}


do {
    var h = try parse("2.5A")
    print(h)
    
}catch{
    print("Error")
}








		