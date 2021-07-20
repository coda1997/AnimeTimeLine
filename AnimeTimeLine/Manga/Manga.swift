//
//  Manga.swift
//  Manga
//
//  Created by 沈达 on 2021/7/18.
//

import Foundation
import SwiftUI


struct Manga: Identifiable{
    var id:UUID
    var title:String
    var imagePath:String
    var image:Image{
        Image(imagePath)
        
    }
}