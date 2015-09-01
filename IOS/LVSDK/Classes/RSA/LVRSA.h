//
//  LVRSA.h
//  LVSDK
//
//  Created by dongxicheng on 4/28/15.
//  Copyright (c) 2015 dongxicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVRSA : NSObject

// 测试
-(void) test;

// 解密
+(NSData*) decrypt:(NSData*) data;


+(BOOL) verifyData:(NSData*)data withSignedData:(NSData*) sign;

+(NSData*) aesKeyBytes;

/*
 * 设置证书名
 */
+ (void) setPublicKeyFilePath:(NSString*) filePath;

@end
