//
//  AnimeView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/2.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct AnimeView: View {
    var anime : Anime
    let baseUrlString : String
    var body: some View {
        VStack(alignment: .leading){
            
            WebImage(url: URL(string: baseUrlString+anime.icon!))
                .resizable()
                .scaledToFit()
                .cornerRadius(4)
            HStack {
                Spacer()
                Text(anime.name ?? "")
                    
                Spacer()
            }
        }.shadow(radius: 4)
            
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView(anime: Anime(), baseUrlString: "")
    }
}
