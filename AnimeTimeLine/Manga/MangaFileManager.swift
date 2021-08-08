//
//  MangaFileManager.swift
//  MangaFileManager
//
//  Created by 沈达 on 2021/8/8.
//

import Foundation
import Tiercel
class MangaFileManager{
    private init(){}
    public static let shared = MangaFileManager()
    var sessionManager:SessionManager = {
        var configuration = SessionConfiguration()
        configuration.allowsCellularAccess = true
        let manager = SessionManager("default", configuration: configuration)
        return manager
    }()
    
    public func download(path:String, uiCallBack:@escaping (Double, String)->Void){
        let task = sessionManager.download(path)
        task?.progress(onMainQueue: true){ (task) in
            let progress = task.progress.completedUnitCount
            let total = task.progress.totalUnitCount
            print("downloading process \(progress) total: \(total)")
            uiCallBack(Double(progress)/Double(total), task.filePath)
        }.success {
            task in
            
            print("download \(path) succeed")
            print(task.fileName)
            print(task.filePath)
        }.failure {
            task in
            print("download \(path) failed")
        }
        
        
    }
    
}
