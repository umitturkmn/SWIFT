import UIKit

var myName : String? // soru işareti belki olur belki olmaz

myName?.uppercased()
//! ünlem işareti yüzde yüz eminim demektir

var myString = "Lars"

//optionals : ? vs !
var myAge = "asd"

var myInt = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge) {
    print(myNumber * 5)
} else {
    print("yanlış")
}



