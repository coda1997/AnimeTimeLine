//
//  MangaView.swift
//  MangaView
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI
import EPUBKit

struct MangaView: View {
    var manga:Manga
    var title:String = manga.getEpub()?.title ?? "no found title"
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
    func getEpub()->EPUBDocument? {
        guard let path = Bundle.main.url(forResource: "搾精病棟～性格最悪のナースしかいない病院で射精管理生活～", withExtension: "epub"),
              let document = EPUBDocument(url: path)
        else{
            return nil
        }
        return document
    }
}

struct MangaView_Previews: PreviewProvider {
    static var previews: some View {
        MangaView(manga: Manga(id: UUID(), title: "zhang3", imagePath: "test1"))
    }
}
