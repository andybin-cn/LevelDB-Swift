//
//  LevelDB.swift
//  LevelDBForSwift
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 Binea. All rights reserved.
//

import Foundation

open class LevelDB {
    
    public private(set) var db: UnsafeMutableRawPointer?
    
    public init(filePath: String) {
        var cChar: [CChar] = [CChar].init(repeating: 0, count: 2048)
        _ = filePath.getCString(&cChar, maxLength: 2048, encoding: .utf8)
        self.db = c_creatLeveldb(&cChar)
    }
    
    convenience init(name: String) {
        let filePath = NSHomeDirectory() + "/Documents/" + name
        self.init(filePath: filePath)
    }
    
    func set(_ value: Data, forKey key: String) {
        let basePointer = UnsafeMutablePointer<Int8>.allocate(capacity: value.count)
        basePointer.initialize(to: 0, count: value.count)
        let pointer = UnsafeMutableBufferPointer<Int8>.init(start: basePointer, count: value.count)
//        value.copyBytes(to: basePointer, count: value.count)
        let count = value.copyBytes(to: pointer)
        guard let db = self.db else {
            return
        }
        guard var keyChar: [CChar] = key.cString(using: .utf8) else {
            return
        }
        let keyCstring = _CString_(basePtr: &keyChar, lenght: keyChar.count)
        let valueCstring = _CString_(basePtr: pointer.baseAddress, lenght: pointer.count)
        c_leveldbSetValue(db, keyCstring, valueCstring)
        basePointer.deallocate(capacity: pointer.count)
    }
    
    func getData(forKey key: String) -> Data? {
        guard let db = self.db else {
            return nil
        }
        guard var keyChar: [CChar] = key.cString(using: .utf8) else {
            return nil
        }
        var keyCstring = _CString_(basePtr: &keyChar, lenght: keyChar.count)
        var valueString = c_leveldbGetValue(db, &keyCstring)
        let data = Data.init(bytes: valueString.basePtr, count: valueString.lenght)
        c_FreeCString(&valueString)
        return data
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
            var valueString = c_leveldbGetValue(db, &keyCstring)
            let string = String.init(cString: valueString.basePtr)
            c_FreeCString(&valueString)
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
