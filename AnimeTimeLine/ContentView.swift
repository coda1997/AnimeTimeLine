//
//  ContentView.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/1.
//

import SwiftUI

struct ContentView: View {
    let imageUrl = URL(string: "https://bangumi.moe/data/images/2014/12/6dznn2rykghikpgav2k.jpg")
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: imageUrl){image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                
            }
                
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
