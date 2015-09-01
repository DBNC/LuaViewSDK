//
//  LVHttp.h
//  LVSDK
//
//  Created by dongxicheng on 2/2/15.
//  Copyright (c) 2015 dongxicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVHeads.h"



typedef struct _LVUserDataHttp {
    LVUserDataCommonHead;
    const void* http;
} LVUserDataHttp;





@interface LVHttp : NSObject

@property(nonatomic,weak) LView* lview;
@property(nonatomic,assign) LVUserDataHttp* userData;

-(id) init:(lv_State*) l;

+(int) classDefine:(lv_State *)L ;

@end
