//
//  MangaProvider.swift
//  MangaProvider
//
//  Created by 沈达 on 2021/8/7.
//

import Bookbinder
import SwiftUI
import OSLog
import CoreData

class MangaProvider{
    private init(){
        print("manga provider init start")
    }
    private let logger = Logger(subsystem: "cn.dadachen.AnimeTimeLine", category: "epub")
    private lazy var bookBinder: Bookbinder = Bookbinder()
    public static let shared = MangaProvider()
    
    let urlString = Bundle.main.localizedString(forKey: "manga_base_url", value: nil, table: "Strings")
    
//    public func getDemoEpub() -> Manga?{
//        guard let path = Bundle.main.url(forResource: "t2", withExtension: "epub") else {
//            print("[epub] not found")
//            return nil
//            
//        }
//        guard let ebook = bookBinder.bindBook(at: path) else {
//            return nil
//        }
//        self.ebook = ebook
//        let epub = paserEpubFileToManga(ebook: ebook)
//        
//        return epub
//        
//    }
//    public func getCoverPath()-> URL?{
//        return ebook?.coverImageURLs[0] ?? nil
//    }
//    private var ebook:EPUBBook? = nil
//    private func paserEpubFileToManga(ebook:EPUBBook)->Manga{
//        let imagePath = ebook.coverImageURLs[0]
//        let title = ebook.opf.metadata.titles[0]
//        return Manga
//    }
    
    lazy var container: NSPersistentContainer = AnimeProvider.shared.container
    
    private func newTaskContext() -> NSManagedObjectContext{
        return container.newBackgroundContext()
    }
    
    func fetchMangas() async {
        do{
            logger.debug("url: \(self.urlString)/mangas.json")
            
            let (data, _) = try await URLSession.shared.data(from: URL(string: urlString+"/mangas.json")!)
            let mangas = try JSONDecoder().decode([Manga].self, from: data)
            logger.debug("mangas count: \(mangas.count)")
            await importMangas(from: mangas)
        } catch {
            print("manga perser error")
            
            print("manga \(error)")
            return
        }
    }
    private func importMangas(from mangas:[Manga]) async {
        guard !mangas.isEmpty else {
            return
        }
        
        let context = newTaskContext()
        context.name = "importMangas"
        context.transactionAuthor = "AnimeTimeLine"
        
        await context.perform {
            let batchInsertRequest = self.newBatchInsertRequest(with: mangas)
            
            if let fetchResult = try? context.execute(batchInsertRequest),
               let batchInsertResult = fetchResult as?
                NSBatchInsertResult,
               let success = batchInsertResult.result as? Bool,
               success {
                return
            }
            self.logger.debug("Failed to load manga from json into db")
        }
        logger.debug("successd loading manga json")
    }
    
    private func newBatchInsertRequest(with mangaList:[Manga]) -> NSBatchInsertRequest {
        var index = 0
        let total = mangaList.count
        
        let batchInsertRequest = NSBatchInsertRequest(entity: MangaEntity.entity(), dictionaryHandler: {
            dictionary in
            guard index < total else{
                return true
            }
            dictionary.addEntries(from: mangaList[index].dictionaryValue)
            index += 1
            return false
        })
        return batchInsertRequest
    }
    
}
