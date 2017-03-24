//
//  LevelDB.swift
//  LevelDBForSwift
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 Binea. All rights reserved.
//

import Foundation

open class LevelDB {
    
    public var db: UnsafeMutableRawPointer?
    
    public init(name: String) {
        let filePath = NSHomeDirectory() + "/Documents/" + name
        var cChar: [CChar] = [CChar].init(repeating: 0, count: 1024)
        _ = filePath.getCString(&cChar, maxLength: 1024, encoding: .utf8)
        self.db = c_creatLevelDB(&cChar)
    }
    
    
    public func close() {
        if let db = self.db {
            c_closeLevelDB(db)
        }
    }
}
