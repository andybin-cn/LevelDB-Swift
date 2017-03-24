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
    void* c_creatlevelDB(char* path);
#ifdef __cplusplus
}
#endif

//struct DB* call_C_creatDB(char* path);

#endif /* Wrapper_hpp */
