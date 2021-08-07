//
//  MangaProvider.swift
//  MangaProvider
//
//  Created by 沈达 on 2021/8/7.
//

import Foundation
import Bookbinder

class MangaProvider{
    private init(){
    }
    private lazy var bookBinder: Bookbinder = Bookbinder()
    public static let shared = MangaProvider()
    
    public func getDemoEpub() -> Manga?{
        guard let path = Bundle.main.url(forResource: "t2", withExtension: "epub") else {
            print("[epub] not found")
            return nil
            
        }
        guard let ebook = bookBinder.bindBook(at: path) else {
            return nil
        }
        
        
        return paserEpubFileToManga(ebook: ebook)
        
    }
    
    private func paserEpubFileToManga(ebook:EPUBBook)->Manga{
        let imagePath = ebook.coverImageURLs[0]
        let title = ebook.opf.metadata.titles[0]
        return Manga(id: UUID(), title: title, imagePath: imagePath.path)
    }
}
