var lottery : Int?
if lottery != nil{
    print(lottery!)
}

lottery = 100

if let winnings =  lottery {
    print(winnings)
}

class Car {
    var model: String?
    
}
var vehicle: Car?

if let v = vehicle {
    if let m = v.model {
        print(m)
    }
}

vehicle = Car()
vehicle?.model = "Bronco"

if let v1 = vehicle, let m1 = v1.model {
    print(m1)
}