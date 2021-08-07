//
//  MangaView.swift
//  MangaView
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI

struct MangaView: View {
    var manga:Manga
    let title:String
    init(manga:Manga){
        self.manga = manga
        self.title = manga.title

    }
    var body: some View {

        VStack{
            Spacer()
            manga.image.resizable()
                .scaledToFit()
            Text(title).lineLimit(1)
        }.frame(height: 250, alignment: .bottom)
    }
}

extension Manga{
    func getEpub()->String? {
        
        
        return "document"
    }
}

struct MangaView_Previews: PreviewProvider {
    static var previews: some View {
        let dommy = Manga(id: UUID(), title: "zhang3", imagePath: "test1")
        MangaView(manga: MangaProvider.shared.getDemoEpub() ?? dommy)
    }
}
