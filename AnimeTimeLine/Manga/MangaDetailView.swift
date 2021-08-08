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
        WebImage(url: URL(string: coverPath))
            .resizable()
            .scaledToFit()
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: MangaEntity())
    }
}
