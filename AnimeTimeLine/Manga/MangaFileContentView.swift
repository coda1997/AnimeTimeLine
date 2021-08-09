//
//  MangaFileContentView.swift
//  MangaFileContentView
//
//  Created by 沈达 on 2021/8/8.
//

import SwiftUI
import Bookbinder
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
    var ebook :EPUBBook? = nil
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
                        downloadManga(urlPath: "https://cdn.jsdelivr.net/gh/coda1997/dson@master/t2.epub", progressValue: $progress, completeHandler: { book in
                            pages.append(contentsOf: book.pages!)
                            print("[ebook] \(pages[0].path)")
                            isReady = true
                        })
                    }
                }
                if pages.count > 4{
//                    Image(uiImage: UIImage(contentsOfFile: pages[0].path)!)
//                    Image(uiImage: UIImage(contentsOfFile: pages[1].path)!)
//                    Image(uiImage: UIImage(contentsOfFile: pages[2].path)!)
//                    Image(uiImage: UIImage(contentsOfFile: pages[3].path)!)
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
    func downloadManga(urlPath:String, progressValue:Binding<Double>, completeHandler: @escaping (EPUBBook) -> Void) {
        AF.download(urlPath)
            .downloadProgress{ progress in
                print("downloading: \(progress.fractionCompleted)")
                progressValue.wrappedValue = progress.fractionCompleted
                
            }.responseURL{ response in
                if response.error == nil, let url = response.fileURL {
                    print("[ebook] start handling")
                    guard let book = Bookbinder().bindBook(at: url) else {
                        print("[ebook] book parser error")
                        return
                    }
                    
                    let title = book.opf.metadata.titles[0]
                    let coverPath = book.coverImageURLs[0].path
                    print("[ebook] title: \(title), file url = \(url.path)")
                    print("[ebook] cover path: \(coverPath)")
                    completeHandler(book)
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
