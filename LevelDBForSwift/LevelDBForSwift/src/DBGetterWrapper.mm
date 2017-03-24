//
//  DBGetterWrapper.m
//  LevelDBForSwift
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 Binea. All rights reserved.
//

#import "DBGetterWrapper.h"
#include "db.h"

@implementation DBGetterWrapper

NSString* c_leveldbGetValue(void* leveldb, NSString* key)
{
    leveldb::Slice keySlice = leveldb::Slice((char *)[key UTF8String], [key lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    std::string valueString;
    leveldb::DB *_db = (leveldb::DB *)leveldb;
    leveldb::ReadOptions readOptions;
    leveldb::Status status = _db->Get(readOptions, keySlice, &valueString);
    if (!status.ok()) {
        printf("%s:%d c_leveldbSetValue error", __FILE__, __LINE__);
    }
    return [[NSString alloc] initWithBytes:valueString.data() length:valueString.size() encoding:NSUTF8StringEncoding];
}


@end

