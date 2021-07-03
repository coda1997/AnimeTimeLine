//
//  ContentView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/1.
//

import SwiftUI

struct ContentView: View {
    var animeProvider = AnimeProvider.shared
    let baseUrlString = Bundle.main.localizedString(forKey: "base_url", value: nil, table: "Strings")

    @FetchRequest(sortDescriptors: [SortDescriptor(\.startDate)])
    private var animes: FetchedResults<Anime>
    
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(animes){ anime in
                        NavigationLink(destination: {
                            AnimeDetailView(anime: anime, baseUrlString: baseUrlString)
                        }, label: {
                            AnimeView(anime: anime, baseUrlString: baseUrlString)
                        }).buttonStyle(.plain)
                    }
                }.padding()
            }.task {
                if animes.isEmpty {
                    await animeProvider.fetchAnimes()
                }
            }.navigationTitle(Text("Animes"))
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
