//
//  MangaDetailView.swift
//  MangaDetailView
//
//  Created by dadachen on 2021/8/8.
//

import SwiftUI
import SDWebImageSwiftUI
import ImageViewer_swift

struct MangaDetailView: View {
    var manga: MangaEntity
    var coverPath:String
    let baseUrl:String = MangaProvider.shared.urlString
    let mangaFilePath = "https://github.com/coda1997/dson/blob/master/t2.epub"

    init(manga:MangaEntity){
        self.manga = manga
        self.coverPath = "\(baseUrl)/\(manga.coverPath!)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        print(coverPath)
    }
    
    @State var isTapped = false
    @State var progress:Double = 0
    @State var read = false
    @State var title:String = ""
    var body: some View {
        List{
            Section("Cover"){
                VStack{
                    WebImage(url: URL(string: coverPath))
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
//                            if !isTapped {
//                                MangaFileManager.shared.download(path: mangaFilePath, uiCallBack: { p, name in
//                                    progress = p
//                                    title = name
//                                })
                                let iv = UIImageView()
                                iv.setupImageViewer(url: URL(string: coverPath)!)
                            
//                            }
                            isTapped = true
                        }
                        
//                    if isTapped {
//                        EpubView(progressValue: $progress, startReading: $read)
//                    }
                }
            }
            Section("Title"){
                Text(manga.title ?? "not found")
            }
            Section("Author"){
                Text(manga.author ?? "not found")
            }
            Section("Type"){
                Text(manga.type ?? "漫画")
            }
        }.listStyle(.plain)
        
        
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: MangaEntity())
    }
}
