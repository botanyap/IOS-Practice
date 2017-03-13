import Foundation

let x = Double("2.5")!
print(x)


//แบบล่างดีกว่าแบบบน กรณีรับค่ามาจาก user
if let y = Double("4.5A") {
    print(y)
}else{
    print("Invalid Number")
}


//if let url = URL(string: "http://superrichthai.com") {
//    do {
//        let contents = try String(contentsOf: url)
//        print(contents)
//        let c = contents.characters
//        
//        
//    }catch {
//        print("Network Error")
//    }
//}

//ดึงรคาทองคำไปใช้
func  price() -> String {
    var result = "Error"
    if let url = URL(string: "http://goldtraders.or.th") {
        do {
            let data = try String(contentsOf : url)
            let c = Array(data.characters)
            let t = Array("lblBLSell".characters)
            var start = -1
            var j = 0
            for i in 0 ..< c.count {
                if c[i] == t[j] { j += 1 } else { j = 0 }
                if j == t.count {
                    start = i
                    break
                }
            }
            if start != -1 {
                result = ""
                for i in start + 35 ... start + 40 {
                    result += String(c[i])
                }
            }
        } catch { }
    }
    return result
}
print("Gold Price = " + price())
