//
//  QYChild.m
//  UICatalog
//
//  Created by qingyun on 14-11-15.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYChild.h"

@implementation QYChild

+ (instancetype)childWithDictionary:(NSDictionary *)dictionary
{
    QYChild *child = [[QYChild alloc]init];
    child.name = dictionary[kName];
    child.phoneNum = dictionary[kPhoneNum];
    child.portrait = dictionary[kPortrait];
    return child;
}

@end
