//
//  AnimeView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/2.
//

import SwiftUI

struct AnimeView: View {
    var anime : Anime
    let baseUrlString = Bundle.main.localizedString(forKey: "base_url", value: nil, table: "Strings")
    var body: some View {
        ZStack(alignment: .bottom){
            AsyncImage(url: URL(string: baseUrlString+anime.cover!)){ image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text(anime.name ?? "").padding()
        }
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView(anime: Anime())
    }
}
