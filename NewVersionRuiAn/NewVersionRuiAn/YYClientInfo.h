//
//  YYClientInfo.h
//  NewVersionRuiAn
//
//  Created by 姚懿恒 on 2019/10/13.
//  Copyright © 2019 姚懿恒. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//NS_DESIGNATED_INITIALIZER
@interface YYClientInfo : NSObject<NSCoding>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSMutableArray *visitDate;
@property (nonatomic, strong) NSMutableArray *descriptions;

- (instancetype)initWithName: (NSString *) name andPhone:(NSString *) number andGender: (NSString *) gender andLocation:(NSString *) location andVisitDate: (NSDate *)visitDate andDescriptions: (NSString *) des;
@end

NS_ASSUME_NONNULL_END
