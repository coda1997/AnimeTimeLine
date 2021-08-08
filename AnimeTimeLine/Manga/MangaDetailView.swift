//
//  MangaDetailView.swift
//  MangaDetailView
//
//  Created by dadachen on 2021/8/8.
//

import SwiftUI
import SDWebImageSwiftUI

struct MangaDetailView: View {
    var manga: MangaEntity
    var coverPath:String
    let baseUrl:String = MangaProvider.shared.urlString
    
    init(manga:MangaEntity){
        self.manga = manga
        self.coverPath = "\(baseUrl)/\(manga.coverPath!)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        print(coverPath)
    }
    
    var body: some View {
        List{
            Section("Cover"){
                WebImage(url: URL(string: coverPath))
                            .resizable()
                            .scaledToFit()
            }
            Section("Title"){
                Text(manga.title ?? "not found")
            }
            Section("Author"){
                Text(manga.author ?? "not found")
            }
            Section("Type"){
                Text(manga.type ?? "漫画")
            }
        }
        
        
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: MangaEntity())
    }
}
