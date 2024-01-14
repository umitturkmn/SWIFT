//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Ümit Türkmen on 14.01.2024.
//

import Foundation
import UIKit

class PlaceModel {
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtm = ""
    var placeImg = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init(){}
    
}
