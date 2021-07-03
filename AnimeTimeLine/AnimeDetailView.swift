//
//  AnimeDetailView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/3.
//

import SwiftUI
import SDWebImageSwiftUI

struct AnimeDetailView: View {
    var anime: Anime
    let baseUrlString: String
    var body: some View {
        WebImage(url: URL(string: baseUrlString+anime.cover!))
            .resizable()
            .scaledToFit()
        Text(anime.name ?? "")
    }
}

struct AnimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetailView(anime: Anime(), baseUrlString: "")
    }
}
