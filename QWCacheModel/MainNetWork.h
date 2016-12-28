//
//  MainNetWork.h
//  CQZX-INK
//
//  Created by qingweiqw on 16/11/6.
//  Copyright © 2016年 qingweiqw. All rights reserved.
//
#import <Foundation/Foundation.h>
typedef void(^requestSuccess)(id obj);
typedef void(^requestFailed)(id error);
@interface MainNetWork : NSObject
+ (void)getTopData:(NSDictionary *)dic success:(requestSuccess)Success faile:(requestFailed)faile;
@end
