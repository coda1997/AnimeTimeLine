//
//  MangaFileContentView.swift
//  MangaFileContentView
//
//  Created by 沈达 on 2021/8/8.
//

import SwiftUI
import Bookbinder
import SDWebImageSwiftUI

struct MangaFileContentView: View {
    var urlString:String
    init(urlString:String){
        self.urlString = urlString
    }
    @State var isReady = false
    var body: some View {
        ZStack{
            WebImage(url: URL(string: urlString))
                .resizable()
                .scaledToFit()
                .blur(radius: isReady ? 0 : 10)
            if !isReady {
                ProgressView().progressViewStyle(.circular)
            }
        }.onTapGesture {
            isReady.toggle()
        }
        
            
    }
}

struct MangaFileContentView_Previews: PreviewProvider {
    static var previews: some View {
        MangaFileContentView(urlString: "")
    }
}
