//
//  LVTableViewCell.m
//  LVSDK
//
//  Created by dongxicheng on 1/28/15.
//  Copyright (c) 2015 dongxicheng. All rights reserved.
//

#import "LVTableViewCell.h"
#import "LVHeads.h"
#import "LVBaseView.h"
#import "lVtable.h"
#import "LView.h"

@interface LVTableViewCell ()
@property(nonatomic,weak) LView* lv_lview;
@end

@implementation LVTableViewCell


-(void) dealloc{
    lv_State* L = self.lv_lview.l;
    if( L ) {
        lv_createtable(L, 0, 0);
        [LVUtil unregistry:L key:self];
    }
}

-(void) doInitWithLView:(LView*) lview{
    self.lv_lview = lview;
    lv_State* L = lview.l;
    if( L ) {
        lv_createtable(L, 0, 0);
        [LVUtil registryValue:L key:self stack:-1];
    }
}

-(void) pushTableToStack{
    lv_State* L = self.lv_lview.l;
    if( L ) {
        [LVUtil pushRegistryValue:L key:self];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:NO];
}

- (void) setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:NO animated:NO];
}

@end
