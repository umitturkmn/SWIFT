//
//  main.swift
//  AdvanceSwiftProject
//
//  Created by Ümit Türkmen on 27.02.2024.
//

import Foundation


let classJames = MusicianClass(name: "James", age: 50, instrument: "Guitar")
//print(classJames.name)
//
var structJames = MusicianStruct(name: "James", age: 50, instrument: "Guitar")
//print(structJames.age)
//
//
//classJames.age = 51
//print(classJames.age)
//
//structJames.age = 51
//print(structJames)
//
////Reference vs Value
//
//let coppOfClassJames = classJames
//var coppyOfStructJames = structJames

//print(coppOfClassJames.age)
//print(coppyOfStructJames.age)
//
//coppOfClassJames.age = 52
//coppyOfStructJames.age = 52
//
//print(classJames.age)
//print(structJames.age)
//
//// Reference Types --> Class
//// Copy --> Same object new referance -> 1 object + 2 reference
//
////Value Types -> Struct
////Copy -> new object -> 2 objects
//
////Functions vs Mutating Function
//print(classJames.age)
//classJames.happyBirthday()
//print(classJames.age)
//
//print(structJames.age)
//structJames.happyBirthday()
//print(structJames.age)

// Tuple
let myTuple = (1,3)
print(myTuple.0)

var myTuple2 = (1,3,5)
myTuple2.2 = 10
print(myTuple2.2)

let myTuple3 = ("Ümit",100)

let myTuple4 = (10,[1,2,34,5,6,20])
print(myTuple4.1[5])

let predifiendTuple : (String, String)

predifiendTuple.0 = "Ümit"
predifiendTuple.1 = "Türkmen"
print(predifiendTuple)

let newTuple = (name: "James", metallica: true)
print(newTuple.metallica)

//Guard Let vs If Let

//Guard -> Negative
//If -> Positive

let myNumber = "5"

func converToIntegerGuard (stringInput : String) -> Int {
    guard let myInteger = Int(stringInput) else {
        return 0
    }
    return myInteger
    
}
func converToIntegerIf (stringInput : String) -> Int {
    if let myInteger = Int(stringInput) {
        return myInteger
    } else {
        return 0
    }
}

print(converToIntegerIf(stringInput: myNumber))
print(converToIntegerGuard(stringInput: myNumber))

//Switch Case

let myNum = 11

//remainder

let myRemainder = myNum % 2
print(myRemainder)

switch myRemainder {
case 1:
    print(1)
case 2:
    print(2)
case 3:
    print(3)
case 4...7:
    print("çok")
default:
    print("none")
}

//Breakpoint

var x = 5
print(x)
x += 1
print(x)







