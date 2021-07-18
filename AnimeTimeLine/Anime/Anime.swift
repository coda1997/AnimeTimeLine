//
//  Anime.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/2.
//

import Foundation

// MARK: - Coable Data decoding json file

struct AnimeProperty: Codable{
    var id: String{
        _id
    }
    var _id: String
    var name: String
    var credit: String
    var startDate: Int
    var endDate: Int
    var icon: String
    var cover: String
    
    var dictionaryValue: [String:Any] {
        [
            "id": id,
            "name": name,
            "credit": credit,
            "startDate": startDate,
            "endDate": endDate,
            "icon": icon,
            "cover": cover
        ]
    }
}
