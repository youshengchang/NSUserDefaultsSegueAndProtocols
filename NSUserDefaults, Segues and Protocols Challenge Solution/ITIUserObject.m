//
//  ITIUserObject.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by yousheng chang on 8/10/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import "ITIUserObject.h"

@implementation ITIUserObject
-(id)initWithData: (NSDictionary *)data
{
    self = [super init];
    self.userName = data[USER_NAME];
    self.password = data[USER_PASSWORD];
    return self;
    
}
@end
