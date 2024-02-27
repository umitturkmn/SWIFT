import UIKit


func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

sum(num1: 4, num2: 654)




func calculete(num1: Int, num2: Int, sumFunc: (Int,Int) -> Int) -> Int {
    return sumFunc(num1,num2)
}

calculete(num1: 23, num2: 3445, sumFunc : sum)

/*
{ (num1: Int, num2: Int) -> Int in
    return num1 * num2
}
*/

