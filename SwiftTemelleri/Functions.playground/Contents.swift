import UIKit

func myFunction(){
    print("my func")
}
myFunction()

//Input Output Return

func sumFunc(x : Int,y : Int) {
    print(x + y)
}
sumFunc(x: 3, y: 6)

func multiFunc(x : Int,y : Int) -> Int {
    return x * y
}
print(multiFunc(x: 5, y: 12))

func logicFunc(a:Int,b:Int) -> Bool {
    if a > b {
        return true
    } else {
        return false
    }
}

logicFunc(a: 45, b: 123)
