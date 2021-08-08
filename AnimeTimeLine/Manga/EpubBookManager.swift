//
//  EpubBookManager.swift
//  EpubBookManager
//
//  Created by 沈达 on 2021/8/8.
//

import Foundation
import Bookbinder
class EpubBookManager {
    private init(){
        
    }
    private lazy var ebookBinder = Bookbinder()
    public static let shared = EpubBookManager()
    
    public func ebook(path:String)->EPUBBook{
        let url = URL(fileURLWithPath: path)
        return ebookBinder.bindBook(at: url)!
    }
}
