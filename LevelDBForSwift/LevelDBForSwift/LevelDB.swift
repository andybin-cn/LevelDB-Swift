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
        self.db = c_creatLeveldb(&cChar)
    }
    
    subscript(key: String) -> String? {
        get {
            guard let db = self.db else {
                return nil
            }
            guard var keyChar: [CChar] = key.cString(using: .utf8) else {
                return nil
            }
            var keyCstring = _CString_(basePtr: &keyChar, lenght: keyChar.count)
            let valueString = c_leveldbGetValue(db, &keyCstring)
            let string = String.init(cString: valueString.basePtr)
            valueString.basePtr.deinitialize(count: valueString.lenght)
            valueString.basePtr.deallocate(capacity: valueString.lenght)
            return string
        }
        set {
            guard let db = self.db else {
                return
            }
            guard var keyChar: [CChar] = key.cString(using: .utf8) else {
                return
            }
            let keyCstring = _CString_(basePtr: &keyChar, lenght: keyChar.count)
            
            guard var valueChar: [CChar] = newValue?.cString(using: .utf8) else {
                c_leveldbDeleteValue(db, keyCstring);
                return
            }
            let valueCstring = _CString_(basePtr: &valueChar, lenght: valueChar.count)
            c_leveldbSetValue(db, keyCstring, valueCstring)
        }
    }
    
    public func close() {
        if let db = self.db {
            c_closeLeveldb(db)
        }
    }
}
