//
//  ThreePhaseScrambler.m
//  cube4
//
//  Created by MeigenChou on 16/2/3.
//  Copyright (c) 2016年 MeigenChou. All rights reserved.
//

#import "ThreePhaseScrambler.h"
#import "Search4.h"

@implementation ThreePhaseScrambler
@synthesize cube4;

- (id)init {
    if(self = [super init]) {
        cube4 = [[Search4 alloc] init];
    }
    return self;
}

- (NSString *)scramble {
    return [cube4 solution:@"UUURUUUFUUUFUUUFRRRBRRRBRRRBRRRBRRRDFFFDFFFDFFFDDDDBDDDBDDDBDDDLFFFFLLLLLLLLLLLLULLLUBBBUBBBUBBB"];
    //return [cube4 randomState];
}
@end
