//
//  YYClientInfo.m
//  NewVersionRuiAn
//
//  Created by 姚懿恒 on 2019/10/13.
//  Copyright © 2019 姚懿恒. All rights reserved.
//

#import "YYClientInfo.h"
#import "MJExtension.h"

@implementation YYClientInfo
MJCodingImplementation

- (instancetype)initWithName: (NSString *) name andPhone:(NSString *) number andGender: (NSString *) gender andLocation:(NSString *) location andVisitDate: (NSDate *)visitDate andDescriptions: (NSString *) des
{
    if (self = [super init])
    {
        self.name = name;
        self.phoneNumber = number;
        self.gender = gender;
        self.location = location;
        [self.visitDate addObject:visitDate];
        [self.descriptions addObject:des];
    }
    
    return  self;
}

- (NSMutableArray *)visitDate
{
    if (!_visitDate) {
        _visitDate = [NSMutableArray array];
    }
    return  _visitDate;
}
- (NSMutableArray *)descriptions
{
    if (!_descriptions) {
        _descriptions = [NSMutableArray array];
    }
    return _descriptions;
}
@end
