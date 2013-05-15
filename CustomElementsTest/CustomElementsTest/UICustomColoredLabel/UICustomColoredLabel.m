//
//  UICustomColoredLabel.m
//  procyon
//
//  Created by Noelia on 30/04/13.
//  Copyright (c) 2013 BebeInnova S.L. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import "UICustomColoredLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation UICustomColoredLabel

@synthesize color;
@synthesize character;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (id)initWithFrame:(CGRect)frame withCharacter:(NSString *)newCharacter withColor:(UIColor *)newColor
{
    self = [self initWithFrame:frame];
    [self setCharacter:newCharacter];
    [self setColor:newColor];
    [self setBackgroundColor:color];
    [self setText:newCharacter];
    [self setTextAlignment:NSTextAlignmentCenter];
    [self setTextColor:[UIColor whiteColor]];
    [self setFont:[UIFont boldSystemFontOfSize:18]];
    [[self layer] setCornerRadius:4];
    return self;
}

#pragma mark - Draw

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Rect path which will use as glossy rect
    CGMutablePathRef glossPath = CGPathCreateMutable();
    CGPathMoveToPoint(glossPath, nil, self.bounds.origin.x,
                      self.bounds.origin.y + self.bounds.size.height);
    CGPathAddLineToPoint(glossPath, nil, self.bounds.origin.x,
                         self.bounds.origin.y + 2*self.bounds.size.height/3);
    CGPathAddLineToPoint(glossPath, nil, self.bounds.origin.x + self.bounds.size.width,
                         self.bounds.origin.y + self.bounds.size.height/3);
    CGPathAddLineToPoint(glossPath, nil, self.bounds.origin.x + self.bounds.size.width,
                         self.bounds.origin.y + self.bounds.size.height);
    CGPathAddLineToPoint(glossPath, nil, self.bounds.origin.x,
                         self.bounds.origin.y + self.bounds.size.height);
    
    // Gradient definition
    CGFloat colors[8] = {
        0.9f, 0.9f, 0.9f, 0.5f,
        0.9f, 0.9f, 0.9f, 0
    };
    CGFloat locations[] = { 0.0, 1.0 };
    
    CGPoint startPoint = CGPointMake(self.bounds.origin.x + self.bounds.size.width/2,
                                     self.bounds.origin.y + self.bounds.size.height/3);
    CGPoint endPoint = CGPointMake(self.bounds.origin.x + self.bounds.size.width/2,
                                   self.bounds.origin.y + self.bounds.size.height);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2);
    
    // Draw gloss shadow
    CGContextSaveGState(context);
    CGContextAddPath(context, glossPath);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);    
}

@end
