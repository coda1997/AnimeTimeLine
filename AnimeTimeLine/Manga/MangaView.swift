//
//  MangaView.swift
//  MangaView
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI

struct MangaView: View {
    var manga:Manga
    var body: some View {
        VStack{
            Spacer()
            manga.image.resizable()
                .scaledToFit()
            Text(manga.title).lineLimit(1)
        }.frame(height: 250, alignment: .bottom)
    }
}

struct MangaView_Previews: PreviewProvider {
    static var previews: some View {
        MangaView(manga: Manga(id: UUID(), title: "zhang3", imagePath: "test1"))
    }
}
