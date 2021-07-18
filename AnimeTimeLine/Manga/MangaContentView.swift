//
//  MangaContentView.swift
//  MangaContentView
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI

struct MangaContentView: View {
    var columns: [GridItem] = Array(repeating: .init(), count: 2)
    var mangas: [Manga] = [Manga(id: UUID(), title: "搾精病棟～性格最悪のナースしかいない病院で射精管理生活～", imagePath: "test1"),
                           Manga(id: UUID(), title: "壁尻の刑", imagePath: "test2"),
                           Manga(id: UUID(), title: "壁尻の刑", imagePath: "test2"),
                           Manga(id: UUID(), title: "搾精病棟～性格最悪のナースしかいない病院で射精管理生活～", imagePath: "test1"),
                           Manga(id: UUID(), title: "搾精病棟～性格最悪のナースしかいない病院で射精管理生活～", imagePath:"test1"),
                           Manga(id: UUID(), title: "搾精病棟～性格最悪のナースしかいない病院で射精管理生活～", imagePath: "test1"),
                           Manga(id: UUID(), title: "搾精病棟～性格最悪のナースしかいない病院で射精管理生活～", imagePath: "test1")]

    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(mangas){item in
                        MangaView(manga: item)
                    }

                }.navigationTitle("Manga")
                    .padding()
            }
            
        }
    }
}

struct MangaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MangaContentView()
    }
}
