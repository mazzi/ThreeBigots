//
//  PolygonShape.m
//  WhatATool
//
//  Created by  on 10/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Math.h"
#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

// Custom initializer with parameters
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min
       maximumNumberOfSides:(int)max {
 
    if (self = [super init]) {
        [self setMinimumNumberOfSides:min];
        [self setMaximumNumberOfSides:max];
        [self setNumberOfSides:sides];
    }
    
    return self;
}

// Custom initializer
- (id)init {
    // 5 sided polygon with min of 3 sides and max of 10.
    return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

// Custom dealloc
-(void) dealloc {
    NSLog( @"Dealloc is being called..." );
    [super dealloc];
}



// Setters & Getters

-(float)getAngleInDegrees {
    return (180 * (numberOfSides - 2) / numberOfSides);
}

-(float)getAngleInRadians {
    return (M_PI * (numberOfSides - 2) / numberOfSides);
}

-(NSString*)getName {
    switch (numberOfSides)
    {
        case 3: return @"Triangle";
        case 4: return @"Quadrilateral";
        case 5: return @"Pentagon";
        case 6: return @"Hexagon";
        case 7: return @"Heptagon"; 
        case 8: return @"Octagon"; 
        case 9: return @"Nonagon"; 
        case 10: return @"Decagon"; 
        case 11: return @"Hendecagon"; 
        case 12: return @"Dodecagon";
        default: return @"Uhmm?";
    }
}

-(NSString*) description {
    return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %0.5f degrees (%0.5f radians)", numberOfSides, [self getName], [self getAngleInDegrees], [self getAngleInRadians]];
}

/*
 • numberOfSides – between the minimum and maximum number of sides 
 • minimumNumberOfSides – greater than 2
 • maximumNumberOfSides – less than or equal to 12
 */

- (void)setNumberOfSides:(int)value {
    if (value <= self.maximumNumberOfSides) {
        if (value > self.minimumNumberOfSides) {
            numberOfSides = value;
        } else {
            NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", value, self.minimumNumberOfSides);
        }
    } else {
        NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", value, self.maximumNumberOfSides);
    }


}

- (void)setMinimumNumberOfSides:(int)value {
    if (value > 2) {
        minimumNumberOfSides = value;
    } else {
        NSLog(@"MinimumNumberOfSides out of range. Should be greater than 2.");
    }
}

- (void)setMaximumNumberOfSides:(int)value {
    if (value <= 12) {
        maximumNumberOfSides = value;
    } else {
        NSLog(@"MaximumNumberOfSides out of range. Should be less or equal to 12.");
    }
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    float radius = 0.9 * center.x;
    NSMutableArray *result = [NSMutableArray array];
    float angle = (2.0 * M_PI) / numberOfSides;
    float exteriorAngle = M_PI - angle;
    float rotationDelta = angle - (0.5 * exteriorAngle);
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
        float newAngle = (angle * currentAngle) - rotationDelta;
        float curX = cos(newAngle) * radius;
        float curY = sin(newAngle) * radius;
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX,
                                                                center.y + curY)]];
    }
    return result;
}


@end
