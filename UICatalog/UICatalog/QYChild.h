//
//  QYChild.h
//  UICatalog
//
//  Created by qingyun on 14-11-15.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kName       @"name"
#define kPhoneNum   @"phoneNum"
#define kPortrait   @"portrait"

@interface QYChild : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *phoneNum;
@property(nonatomic,copy)NSString *portrait;

+ (instancetype)childWithDictionary:(NSDictionary *)dictionary;

@end
