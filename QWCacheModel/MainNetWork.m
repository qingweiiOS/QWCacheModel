//
//  MainNetWork.m
//  CQZX-INK
//
//  Created by qingweiqw on 16/11/6.
//  Copyright © 2016年 qingweiqw. All rights reserved.
//

#import "MainNetWork.h"

#import "QWLiveModel.h"
#import "QWNetWokHelper.h"
#import "QWCommonlyConst.h"
#import <MJExtension/MJExtension.h>


@implementation MainNetWork

+ (void)getTopData:(NSDictionary *)dic success:(requestSuccess)Success faile:(requestFailed)faile
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_HOST,API_LiveGetTop];
    
    [[QWNetWokHelper qwNetWorkHelper] getRequest:url turnRound:^(id obj, NSError *error) {
        if(error)
        {
//            NSLog(@"%@",error);
            faile(error);
        }
        else
        {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];

            NSArray *models = [QWLiveModel mj_objectArrayWithKeyValuesArray:[dic objectForKey:@"lives"]];
            //构建路径
            NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/QWLiveModel.archiver"];
             // 数据模型缓存
            [NSKeyedArchiver archiveRootObject:models toFile:path];
            //回调
            Success(models);
        }
    }];
    
    
}
@end
