//
//  main.swift
//  ProtocolSwift
//
//  Created by Ümit Türkmen on 27.02.2024.
//

import Foundation

protocol Running {
    func myRun()
}

class Animal {
    func running(){
        print("running")
    }
}
class Dog : Running {
    func myRun() {
        print("runnnn")
    }
    
    
}

let barley = Dog()
barley.myRun()

class Turtle : Animal , Running{
    func myRun() {
        print("running")
    }
    
    
}
let leanorda = Turtle()
leanorda.myRun()



struct Bird : Running {
    func myRun() {
        print("runnnn")
    }
}
let myBird = Bird()
myBird.myRun()
