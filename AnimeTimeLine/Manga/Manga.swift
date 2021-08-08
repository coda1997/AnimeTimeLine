//
//  Manga.swift
//  Manga
//
//  Created by 沈达 on 2021/7/18.
//

import Foundation
import SwiftUI
import OSLog
import MapKit

struct Manga :Codable{
    var title:String
    var author:String?
    var coverPath:String
//    var image:Image{
//        do{
//            let data = try Data(contentsOf: URL(fileURLWithPath: imagePath))
//            return Image(uiImage: UIImage.init(data: data)!)
//        }catch{
//
//        }
//        return Image(imagePath)
//
//    }
    var type: String?
    var dictionaryValue: [String:Any] {
        [
            "title": title,
            "coverPath": coverPath,
            "type": type ?? "漫画",
            "author": author ?? "佚名"
        ]
    }
}
