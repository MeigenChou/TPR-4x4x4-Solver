//
//  CenterCube.m
//  DCTimer
//
//  Created by meigen on 15/10/30.
//
//

#import "CenterCube.h"
#import "Util.h"

@implementation CenterCube
int center333Map[] = {0, 4, 2, 1, 5, 3};
extern int centerFacelet[];

-(id) init {
    if (self = [super init]) {
        for (int i=0; i<24; i++) {
            ct[i] = centerFacelet[i] / 16;
        }
    }
    return self;
}

-(id)initCenter:(CenterCube *)c {
    if (self = [super init]) {
        [self copy:c];
    }
    return self;
}

-(id)initRandomCent {
    if (self = [super init]) {
        srand((unsigned)time(0));
        for (int i=0; i<24; i++) {
            ct[i] = centerFacelet[i] / 16;
        }
        for (int i=0; i<23; i++) {
            int t = i + (rand() % (24 - i));
            if (ct[t] != ct[i]) {
                int m = ct[i];
                ct[i] = ct[t];
                ct[t] = m;
            }
        }
    }
    return self;
}

/*-(id) initWithMove:(int[])movesq len:(int)len {
    if (self = [super init]) {
        for (int i=0; i<24; i++)
            ct[i] = i / 4;
        for (int m=0; m<len; m++) {
            [self move:m];
        }
        srand((unsigned)time(0));
    }
    return self;
}*/

-(void)copy:(CenterCube *)c {
    for (int i=0; i<24; i++) {
        self->ct[i] = c->ct[i];
    }
}

-(void)fill333Facelet:(char[])facelet {
    int firstIdx = 4, inc = 9;
    char ts[] = {'U', 'R', 'F', 'D', 'L', 'B'};
    for (int i=0; i<6; i++) {
        int idx = center333Map[i] << 2;
        if (ct[idx] != ct[idx+1] || ct[idx+1] != ct[idx+2] || ct[idx+2] != ct[idx+3]) {
            NSLog(@"Unsolved Center");
            return;
        }
        facelet[firstIdx + i * inc] = ts[ct[idx]];
    }
}

-(void) move:(int)m {
    int key = m % 3;
    m /= 3;
    switch (m) {
        case 6: //u
            [Util swap:ct a:8 b:20 c:12 d:16 k:key];
            [Util swap:ct a:9 b:21 c:13 d:17 k:key];
        case 0:	//U
            [Util swap:ct a:0 b:1 c:2 d:3 k:key];
            break;
        case 7: //r
            [Util swap:ct a:1 b:15 c:5 d:9 k:key];
            [Util swap:ct a:2 b:12 c:6 d:10 k:key];
        case 1:	//R
            [Util swap:ct a:16 b:17 c:18 d:19 k:key];
            break;
        case 8: //f
            [Util swap:ct a:2 b:19 c:4 d:21 k:key];
            [Util swap:ct a:3 b:16 c:5 d:22 k:key];
        case 2:	//F
            [Util swap:ct a:8 b:9 c:10 d:11 k:key];
            break;
        case 9: //d
            [Util swap:ct a:10 b:18 c:14 d:22 k:key];
            [Util swap:ct a:11 b:19 c:15 d:23 k:key];
        case 3:	//D
            [Util swap:ct a:4 b:5 c:6 d:7 k:key];
            break;
        case 10:    //l
            [Util swap:ct a:0 b:8 c:4 d:14 k:key];
            [Util swap:ct a:3 b:11 c:7 d:13 k:key];
        case 4:	//L
            [Util swap:ct a:20 b:21 c:22 d:23 k:key];
            break;
        case 11:    //b
            [Util swap:ct a:1 b:20 c:7 d:18 k:key];
            [Util swap:ct a:0 b:23 c:6 d:17 k:key];
        case 5:	//B
            [Util swap:ct a:12 b:13 c:14 d:15 k:key];
            break;
    }
}
@end
