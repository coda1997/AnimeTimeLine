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
    var title:String
    init(title:String){
        self.title = title
    }
    var body: some View {
        WebImage(url: URL(string: title))
            .resizable()
            .scaledToFit()
            
    }
}

struct MangaFileContentView_Previews: PreviewProvider {
    static var previews: some View {
        MangaFileContentView(title: "")
    }
}
