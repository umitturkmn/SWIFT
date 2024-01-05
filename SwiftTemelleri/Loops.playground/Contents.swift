import UIKit
//Loops
var myNumber = 1
myNumber = myNumber + 1
myNumber += 1


var number = 0

//while loop

while number < 10 {
    print(number)
    number += 1
}


var characterAlive = true

while characterAlive == true {
    print("hayatta")
    characterAlive = false
}

3 < 5
5 < 3
5 > 3
5 == 5
5 != 5

//for loop

var myFruits = ["orange","apple","banana"]

print(myFruits[0])

for fruit in myFruits {
    print(fruit)
}

var myNumbers = [30,20,60,200,250]
for i in myNumbers {
    print(i / 5)
}

for myNew in 1 ... 5 {
    print(myNew * 5)
}
