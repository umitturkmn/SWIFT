//
//  SuperMusicians.swift
//  MusicianClass
//
//  Created by Ümit Türkmen on 22.12.2023.
//

import Foundation

class SuperMusicians : Musicians {
    
    func sing2(){
        print("ordunun dereleri")
    }
    
    override func sing() {
        super.sing()
        print("ölürüm türkiyem")
    }
    
}


