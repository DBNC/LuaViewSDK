//
//  LVActivityIndicatorView.m
//  LVSDK
//
//  Created by dongxicheng on 7/27/15.
//  Copyright (c) 2015 dongxicheng. All rights reserved.
//

#import "LVActivityIndicatorView.h"
#import "LVBaseView.h"


@implementation LVActivityIndicatorView



-(id) init:(lv_State*) l{
    self = [super init];
    if( self ){
        self.lv_lview = (__bridge LView *)(l->lView);
    }
    return self;
}

-(void) dealloc{
}

#pragma -mark lvNewActivityIndicator
static int lvNewActivityIndicator (lv_State *L) {
    {
        LVActivityIndicatorView* pageControl = [[LVActivityIndicatorView alloc] init:L];
        
        {
            NEW_USERDATA(userData, LVUserDataView);
            userData->view = CFBridgingRetain(pageControl);
            
            lvL_getmetatable(L, META_TABLE_UIActivityIndicatorView );
            lv_setmetatable(L, -2);
        }
        UIView* view = (__bridge UIView *)(L->lView);
        if( view ){
            [view addSubview:pageControl];
        }
    }
    return 1; /* new userdatum is already on the stack */
}

static int startAnimating(lv_State *L) {
    LVUserDataView * user = (LVUserDataView *)lv_touserdata(L, 1);
    if( user ){
        LVActivityIndicatorView* view = (__bridge LVActivityIndicatorView *)(user->view);
        if( view ){
            [view startAnimating];
        }
    }
    return 0;
}

static int stopAnimating(lv_State *L) {
    LVUserDataView * user = (LVUserDataView *)lv_touserdata(L, 1);
    if( user ){
        LVActivityIndicatorView* view = (__bridge LVActivityIndicatorView *)(user->view);
        if( view ){
            [view stopAnimating];
        }
    }
    return 0;
}

static int isAnimating(lv_State *L) {
    LVUserDataView * user = (LVUserDataView *)lv_touserdata(L, 1);
    if( user ){
        LVActivityIndicatorView* view = (__bridge LVActivityIndicatorView *)(user->view);
        if( view ){
            lv_pushboolean(L, view.isAnimating);
            return 1;
        }
    }
    return 0;
}

static int color(lv_State *L) {
    LVUserDataView * user = (LVUserDataView *)lv_touserdata(L, 1);
    if( user ){
        LVActivityIndicatorView* view = (__bridge LVActivityIndicatorView *)(user->view);
        if( view ){
            if( lv_gettop(L)>=2 ) {
                NSUInteger color = lv_tonumber(L, 2);
                float a = ( (color>>24)&0xff )/255.0;
                float r = ( (color>>16)&0xff )/255.0;
                float g = ( (color>>8)&0xff )/255.0;
                float b = ( (color>>0)&0xff )/255.0;
                if( a==0 ){
                    a = 1;
                }
                if( lv_gettop(L)>=3 ){
                    a = lv_tonumber(L, 3);
                }
                view.color = [UIColor colorWithRed:r green:g blue:b alpha:a];;
                return 0;
            } else {
                UIColor* color = view.color;
                NSUInteger c = 0;
                float a = 0;
                if( lv_uicolor2int(color, &c, &a) ){
                    lv_pushnumber(L, c );
                    lv_pushnumber(L, a );
                    return 2;
                }
            }
        }
    }
    return 0;
}

+(int) classDefine:(lv_State *)L {
    {
        lv_pushcfunction(L, lvNewActivityIndicator);
        lv_setglobal(L, "UIActivityIndicatorView");
    }
    const struct lvL_reg memberFunctions [] = {
        {"startAnimating",  startAnimating },
        {"stopAnimating",   stopAnimating },
        {"isAnimating",  isAnimating },
        {"color", color},
        {NULL, NULL}
    };
    
    lv_createClassMetaTable(L, META_TABLE_UIActivityIndicatorView);
    
    lvL_openlib(L, NULL, [LVBaseView baseMemberFunctions], 0);
    lvL_openlib(L, NULL, memberFunctions, 0);
    return 1;
}



@end
