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
                }.tag(1)
                .onTapGesture {
                    self.num = 1
                }
            MangaContentView()
                .tabItem{
                    Label("Manga", systemImage: "books.vertical")
                }.tag(2)
                .onTapGesture {
                    self.num = 2
                }
            
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
