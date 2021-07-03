//
//  AppDelegate.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/3.
//

import Foundation
import UIKit
import SDWebImage

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
            
        // Add multiple caches
        let cache = SDImageCache(namespace: "tiny")
        cache.config.maxMemoryCost = 100 * 1024 * 1024 // 100MB memory
        cache.config.maxDiskSize = 100 * 1024 * 1024 // 50MB disk
        SDImageCachesManager.shared.addCache(cache)
        SDWebImageManager.defaultImageCache = SDImageCachesManager.shared
        
        
        print("Your code here")
        return true
    }
}
