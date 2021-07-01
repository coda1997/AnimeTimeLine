//
//  ContentView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/1.
//

import SwiftUI

struct ContentView: View {
    let baseUrlString = "https://bangumi.moe/"
    @StateObject var animes = Animes()
    var body: some View {
        List{
            ForEach(animes.items){ anime in
                AsyncImage(url: URL(string: baseUrlString+anime.cover)){image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
            
        }.task {
            await animes.loadData()
            animes.items.sort(by: {
                $0.startDate > $1.startDate
            })
        }
 
    }
    

}

class Animes: ObservableObject {
    @Published var items: [Anime] = []
    
    fileprivate func loadData() async{
        guard let url = URL(string: "https://bangumi.moe/api/bangumi/current") else {
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let animes = try JSONDecoder().decode([Anime].self, from: data)
            items = animes
        }
        catch{
            return
        }
    }
}

struct Anime: Codable {
    var id: String{
        _id
    }
    var _id: String
    var name: String
    var credit: String
    var startDate: Int
    var endDate: Int
    var icon: String
    var cover: String
}
extension Anime: Identifiable{}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
