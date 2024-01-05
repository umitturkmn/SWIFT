import UIKit

var greeting = "Hello, playground"
//Arrays //Diziler

var myFavMovies = ["Harry Potter","Kill Bill","Ölümlü Dünya",5,true] as [Any]
//as --> casting yani bişeyi bişey gibi tanımla

myFavMovies[0]
myFavMovies[4]

var myStringArray = ["ümit","2","3"]
myStringArray[0].uppercased()

myStringArray[myStringArray.count-1]
myStringArray.last


myStringArray.sort()


//set sırasız koleksiyon demektir
var mySet : Set = [1,2,3,4,5,1,2,2,3]
mySet.first
print(mySet)
//tekrar edenleri bir sefer kaydeder

var myInternetArray = [1,2,3,4,55,2,3,4,5,6]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

//Dictionary
//key value pairing

var MyFavDirectors = ["Pulp Fiction" : "Tarantino","Lock" : "Guy", "The Dark Knight" : "Nolan"]

MyFavDirectors["The Dark Knight"]

