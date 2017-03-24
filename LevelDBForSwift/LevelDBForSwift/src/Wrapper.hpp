//
//  Wrapper.hpp
//  GradingTest
//
//  Created by Leo on 2017/3/24.
//  Copyright © 2017年 DoSoMi. All rights reserved.
//

#ifndef Wrapper_hpp
#define Wrapper_hpp

#ifdef __cplusplus
extern "C" {
#endif
    void* c_creatLevelDB(char* path);
    void c_closeLevelDB(void* leveldb);
#ifdef __cplusplus
}
#endif

#endif /* Wrapper_hpp */
