
//
//  QWLiveModel.m
//  CQZX-INK
//
//  Created by qingweiqw on 16/11/6.
//  Copyright © 2016年 qingweiqw. All rights reserved.
//

#import "QWLiveModel.h"

@implementation QWLiveModel
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.stream_addr forKey:@"stream_addr"];
    [aCoder encodeObject:self.online_users forKey:@"online_users"];
    [aCoder encodeObject:self.creator forKey:@"creator"];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.city forKey:@"city"];
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.stream_addr = [aDecoder decodeObjectForKey:@"stream_addr"];
    self.online_users = [aDecoder decodeObjectForKey:@"online_users"];
    self.creator = [aDecoder decodeObjectForKey:@"creator"];
    self.id = [aDecoder decodeObjectForKey:@"id"];
    self.city = [aDecoder decodeObjectForKey:@"city"];
    return self;
}
@end
