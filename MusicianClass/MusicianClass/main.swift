//
//  main.swift
//  MusicianClass
//
//  Created by Ümit Türkmen on 22.12.2023.
//

import Foundation

let james = Musicians(name: "James", age: 23, instrument: "guitar",type: .Bassist)
print(james.age)
print(james.type)
james.sing()

let kirk = SuperMusicians(name: "kirk", age: 34, instrument: "Bass", type: .LeadGuitar)
kirk.sing()
kirk.sing2()

