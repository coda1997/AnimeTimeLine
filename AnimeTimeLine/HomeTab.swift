//
//  HomeTab.swift
//  HomeTab
//
//  Created by 沈达 on 2021/7/18.
//

import SwiftUI

struct HomeTab: View {
    @State var num:Int = 1
    var body: some View {
        TabView(selection: $num){
            ContentView()
                .tabItem{
                    Label("Anime", systemImage: "rectangle.stack.badge.play.crop")
                }
            MangaContentView()
                .tabItem{
                    Label("Manga", systemImage: "books.vertical")
                }
            
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
