//
//  Musicians.swift
//  MusicianClass
//
//  Created by Ümit Türkmen on 22.12.2023.
//

import Foundation

enum MusiciansType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
}

class Musicians {
    
    var name : String
    var age : Int
    var instrument : String
    var type : MusiciansType
    
    init(name: String, age: Int, instrument: String, type : MusiciansType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
    }
    
    
    func sing(){
        print("nothing else matter")
    }
    
    
    
    
    
    
    
    
}
