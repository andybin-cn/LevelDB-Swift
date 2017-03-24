//
//  DBGetterWrapper.h
//  LevelDBForSwift
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 Binea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBGetterWrapper : NSObject

NSString* c_leveldbGetValue(void* leveldb, NSString* key);

@end

