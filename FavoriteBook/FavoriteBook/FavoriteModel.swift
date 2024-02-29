//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by Ümit Türkmen on 29.02.2024.
//

import Foundation
import SwiftUI

struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElements]
}

struct FavoriteElements : Identifiable {
    var id = UUID()
    var name : String
    var imageName : String
    var description : String
}

let ottoman = FavoriteElements(name: "Osmanlı İmparatorluğu", imageName: "ottoman", description: "Osmanoğulları Hanedanlığı")
let british = FavoriteElements(name: "Birleşik Krallık", imageName: "british", description: "İngiliz Kraliyet Ailesi")
let hollyroman = FavoriteElements(name: "Kutsal Roma İmparatorluğu", imageName: "hollyroman", description: "Değişik Ülkeler Kralları")

let favoriteDynasty = FavoriteModel(title: "Favori Hanedanlarım", elements: [ottoman,british,hollyroman])


let selim = FavoriteElements(name: "I. Selim", imageName: "selim", description: "Yavuz Sultan Selim")
let sarlman = FavoriteElements(name: "Şarlman", imageName: "sarlman", description: "Yüce Kral Şarlman")
let richard = FavoriteElements(name: "I. Richard", imageName: "richard", description: "Aslan Yürekli Richard")

let favoriteLeader = FavoriteModel(title: "Favori Liderlerim", elements: [selim,sarlman,richard])

let myFavorites = [favoriteDynasty,favoriteLeader]
