//
//  PolygonShape.h
//  WhatATool
//
//  Created by  on 10/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject {
    @private
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
    float angleInDegrees;
    float angleInRadians;
    NSString *name;
    
}

// Warning with '(nonatomic)' keyword because is not threadsafe!

@property (nonatomic) int numberOfSides;
@property (nonatomic) int minimumNumberOfSides;
@property (nonatomic) int maximumNumberOfSides;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min
       maximumNumberOfSides:(int)max;

- (void)setNumberOfSides:(int)value;
- (void)setMinimumNumberOfSides:(int)value;
- (void)setMaximumNumberOfSides:(int)value;

-(NSString*)getName;
-(float)getAngleInDegrees;
-(float)getAngleInRadians;

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
