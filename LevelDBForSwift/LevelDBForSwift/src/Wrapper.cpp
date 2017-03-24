//
//  Wrapper.cpp
//  GradingTest
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 DoSoMi. All rights reserved.
//

#include "Wrapper.hpp"
#include "db.h"

void* c_creatlevelDB(char* path) // wrapper function
{
    leveldb::DB *_db;
    leveldb::Options options;
    options.create_if_missing = true;
    std::string string = path;
    leveldb::DB::Open(options, string, &_db);
    
    return _db;
}
