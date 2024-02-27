//
//  MusicianStruct.swift
//  AdvanceSwiftProject
//
//  Created by Ümit Türkmen on 27.02.2024.
//

import Foundation


struct MusicianStruct {
    
    var name : String
    var age : Int
    var instrument : String
    
    
    mutating func happyBirthday(){
        self.age += 1
    }
}


