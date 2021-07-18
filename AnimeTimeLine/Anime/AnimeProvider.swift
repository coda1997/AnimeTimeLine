//
//  AnimeProvider.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/2.
//

import CoreData
import OSLog

class AnimeProvider {
    
//    let baseUrlString:String = Bundle.main.localizedString(forKey: "base_url", value: nil, table: "Strings")
    let urlString = Bundle.main.localizedString(forKey: "current_fetch_url", value: nil, table: "Strings")
    
    let logger = Logger(subsystem: "cn.dadachen.AnimeTimeLine", category: "persistence")
    
    static let shared = AnimeProvider()
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "AnimeDB")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
        
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = container.newBackgroundContext()
        return taskContext
    }
    
    func fetchAnimes() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: urlString)!)
            let animePropertyList = try JSONDecoder().decode([AnimeProperty].self, from: data)
            print(animePropertyList[0].icon)
            await importAnimes(from: animePropertyList)
        } catch {
            return
        }
    }
    
    
    
    private func importAnimes(from animePropertyList: [AnimeProperty]) async {
        guard !animePropertyList.isEmpty else {
            return
        }
        
        let taskContext = newTaskContext()
        taskContext.name = "importAnimes"
        taskContext.transactionAuthor = "AnimeTimeLine"
        
        await taskContext.perform {
            let batchInsertRequest = self.newBatchInsertRequest(with: animePropertyList)
            
            if let fetchResult = try? taskContext.execute(batchInsertRequest),
               let batchInsertResult = fetchResult as? NSBatchInsertResult,
               let success = batchInsertResult.result as? Bool, success{
                return
            }
            self.logger.debug("Failed to execute batch insert request.")
        }
        logger.debug("Successfully inserted data.")

    }
    
    private func newBatchInsertRequest(with animePropertyList: [AnimeProperty]) -> NSBatchInsertRequest{
        var index = 0
        let total = animePropertyList.count
        
        let batchInsertRequest = NSBatchInsertRequest(entity: Anime.entity(), dictionaryHandler: {
            dictionary in
            guard index < total else {
                return true
            }
            
            dictionary.addEntries(from: animePropertyList[index].dictionaryValue)
            index += 1
            return false
        })
        return batchInsertRequest
    }
    
}
