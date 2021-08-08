//
//  MangaView.swift
//  MangaView
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct MangaView: View {
    var manga:MangaEntity
    let title:String
    let baseUrl = MangaProvider.shared.urlString
    var url:String
    init(manga:MangaEntity){
        self.manga = manga
        self.title = manga.title ?? "not found"
        self.url = "\(baseUrl)/\(manga.coverPath!)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var body: some View {
        VStack{
            Spacer()
            WebImage(url: URL(string: url))
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
            Text(title).lineLimit(1)
        }.frame(height: 250, alignment: .bottom)
            .shadow(radius: 4)

    }
}

extension Manga{
    func getEpub()->String? {
        
        
        return "document"
    }
}

struct MangaView_Previews: PreviewProvider {
    static var previews: some View {
        
        MangaView(manga: MangaEntity())
    }
}
