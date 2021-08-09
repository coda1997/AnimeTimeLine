//
//  MangaFileContentView.swift
//  MangaFileContentView
//
//  Created by 沈达 on 2021/8/8.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire


struct MangaFileContentView: View {
    var urlString:String
    init(urlString:String){
        self.urlString = urlString
    }
    @State var isReady = false
    @State var progress = 0.0
    @State var pages:[URL] = []
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                    WebImage(url: URL(string: urlString))
                        .resizable()
                        .scaledToFit()
                        .blur(radius: isReady ? 0 : 10)
                    if !isReady {
                        ProgressView(value: progress).progressViewStyle(.circular)
                    }
                }.onTapGesture {
                    if !isReady {
                        downloadManga(urlPath: "https://cdn.jsdelivr.net/gh/coda1997/dson@master/t2.epub", progressValue: $progress)
                    }
                }
                if pages.count > 4{

                }
                
            }
        }
    }
    
}

struct MangaFileContentView_Previews: PreviewProvider {
    static var previews: some View {
        MangaFileContentView(urlString: "")
    }
}

extension MangaFileContentView {
    func downloadManga(urlPath:String, progressValue:Binding<Double>) {
        AF.download(urlPath)
            .downloadProgress{ progress in
                print("downloading: \(progress.fractionCompleted)")
                progressValue.wrappedValue = progress.fractionCompleted
                
            }.responseURL{ response in
                if response.error == nil, let url = response.fileURL {
                    print("[ebook] start handling")
                    
                } else{
                    if let error = response.error?.errorDescription{
                        print("[ebook] error: \(error)")
                        
                    }else{
                        print("[ebook] unknown error")
                    }
                }
            }
    }
}
