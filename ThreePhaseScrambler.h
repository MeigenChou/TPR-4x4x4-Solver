//
//  ThreePhaseScrambler.h
//  cube4
//
//  Created by MeigenChou on 16/2/3.
//  Copyright (c) 2016年 MeigenChou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Search4.h"

@interface ThreePhaseScrambler : NSObject
@property (nonatomic, strong) Search4 *cube4;

- (NSString *)scramble;
@end