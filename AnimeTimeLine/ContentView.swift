//
//  ContentView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/1.
//

import SwiftUI

struct ContentView: View {
    var animeProvider = AnimeProvider.shared
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id)])
    private var animes: FetchedResults<Anime>
    
    var body: some View {
        List{
            Text("\(animes.count)").padding()
            ForEach(animes){ anime in
                AnimeView(anime: anime)
            }
        }.task {
            if animes.isEmpty {
                await animeProvider.fetchAnimes()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
