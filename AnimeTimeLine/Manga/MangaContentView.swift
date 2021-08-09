//
//  MangaContentView.swift
//  MangaContentView
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI

struct MangaContentView: View {
    var columns: [GridItem] = Array(repeating: .init(), count: 2)
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)])
    private var mangas: FetchedResults<MangaEntity>

    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(mangas){item in
                        
                        NavigationLink(destination: {
                            MangaDetailView(manga: item)
                                .navigationBarTitle(item.title ?? "")
                        }, label: {
                            MangaView(manga: item)
                        }).buttonStyle(.plain)
                    }
                    
                }.navigationTitle("Manga")
                    .padding()
            }.task {
                if mangas.isEmpty {
                    await MangaProvider.shared.fetchMangas()
                }
            }
            
        }
    }
}

struct MangaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MangaContentView()
    }
}
