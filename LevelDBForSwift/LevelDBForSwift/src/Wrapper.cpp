//
//  Wrapper.cpp
//  GradingTest
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 DoSoMi. All rights reserved.
//

#include "Wrapper.hpp"
#include "db.h"

void* c_creatLeveldb(char* path) // wrapper function
{
    leveldb::DB *_db;
    leveldb::Options options;
    options.create_if_missing = true;
    std::string string = path;
    leveldb::DB::Open(options, string, &_db);
    
    return _db;
}

void c_closeLeveldb(void* leveldb)
{
    leveldb::DB *_db = (leveldb::DB *)leveldb;
    if (_db) {
        delete _db;
        leveldb = NULL;
    }
}


void c_leveldbSetValue(void* leveldb, _CString_ key, _CString_ value)
{
    leveldb::Slice keySlice = leveldb::Slice(key.basePtr, key.lenght);
    leveldb::Slice valueSlice = leveldb::Slice(value.basePtr, value.lenght);
    leveldb::DB *_db = (leveldb::DB *)leveldb;
    leveldb::WriteOptions writeOption;
    leveldb::Status status = _db->Put(writeOption, keySlice, valueSlice);
    if (status.ok() != true) {
        printf("%s:%d c_leveldbSetValue error", __FILE__, __LINE__);
    }
}

//_CString_ c_leveldbGetValue(void* leveldb, struct _CString_ key)
//{
//    leveldb::Slice keySlice = leveldb::Slice(key.basePtr, key.lenght);
//    std::string valueString;
//    leveldb::DB *_db = (leveldb::DB *)leveldb;
//    leveldb::ReadOptions readOptions;
//    leveldb::Status status = _db->Get(readOptions, keySlice, &valueString);
//    _CString_ result;
//    if (!status.ok()) {
//        printf("%s:%d c_leveldbSetValue error", __FILE__, __LINE__);
//    }
//    long size = valueString.size();
////    char* p = (char*)malloc(size * sizeof(char));
//    result.basePtr = valueString.c_str();
//    result.lenght = valueString.size();
////    std::strcpy(p, valueString.c_str());
//    return result;
//}
