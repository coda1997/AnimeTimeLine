//
//  AnimeTimeLineApp.swift
//  AnimeTimeLine
//
//  Created by 沈达 on 2021/7/1.
//

import SwiftUI
import UIKit

@main
struct AnimeTimeLineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeTab()
                .environment(\.managedObjectContext, AnimeProvider.shared.container.viewContext)
        }
    }
}
