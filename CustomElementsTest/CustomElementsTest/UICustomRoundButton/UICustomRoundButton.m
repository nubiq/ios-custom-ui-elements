//
//  UICustomRoundButton.m
//  Prueba boton
//
//  Created by Juanma Coello on 22/01/13.
//  Copyright (c) 2013 BebeInnova S.L. All rights reserved.
//
// Code in this file:
// - Juanma Coello <juanma@nubiq.es>
// - Noelia Sales <noelia@nubiq.es>

#import "UICustomRoundButton.h"
#include <math.h>

@implementation UICustomRoundButton

@synthesize icon;
@synthesize selected = _selected;

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 26, 26)];
    
    float r = 0x58p1/0xffp1;
    float g = 0x91p1/0xffp1;
    float b = 0xe1p1/0xffp1;
    float a = 1;
    
    [self setColor:[UIColor colorWithRed:r green:g blue:b alpha:a]];
    [self setIcon:[UIImage imageNamed:UICustomIconRemove]];
    
    return self;
}
 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setSelected:NO];
    [self addTarget:self action:@selector(buttonTouched:forEvent:) forControlEvents:UIControlEventAllTouchEvents];
    return self;
}

- (id)initWithFrame:(CGRect)frame icon:(NSString *)iconName
{
    self = [self initWithFrame:frame];
    [self setIcon:[UIImage imageNamed:iconName]];
    return self;
}

- (id)initWithFrame:(CGRect)frame icon:(NSString *)iconName color:(UIColor *)color
{
    self = [self initWithFrame:frame icon:iconName];
    [self setColor:color];
    return self;
}

- (void)drawRect:(CGRect)rect
{    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float avalaibleSize =
        self.bounds.size.height < self.bounds.size.width ?
        self.bounds.size.height :
        self.bounds.size.width;
    
    // Defining rects for every layer
    CGRect outerBorder = CGRectMake(self.bounds.origin.x, self.bounds.origin.y,
                                    avalaibleSize-1, avalaibleSize-1);
    CGRect outerCircle = CGRectMake(self.bounds.origin.x+0.5, self.bounds.origin.y+0.5,
                                    avalaibleSize-3, avalaibleSize-3);
    CGRect innerCircle = CGRectMake(self.bounds.origin.x+3, self.bounds.origin.y+3,
                                    avalaibleSize-7, avalaibleSize-7);
    CGRect glossCircle = CGRectMake(self.bounds.origin.x-avalaibleSize/2, self.bounds.origin.y+avalaibleSize/2,
                                    avalaibleSize*2, avalaibleSize*1.5);
    
    CGFloat angle = atan(icon.size.height/icon.size.width);
    CGRect imageCircle = CGRectMake(4 + ((avalaibleSize-8)/2) - (cos(angle)*(avalaibleSize-8)/2),
                                    4 + ((avalaibleSize-8)/2) - (sin(angle)*(avalaibleSize-8)/2),
                                    cos(angle)*(avalaibleSize-8), sin(angle)*(avalaibleSize-8));
    
    
    CGMutablePathRef outerBorderPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(outerBorderPath, NULL, outerBorder);
    
    CGMutablePathRef outerCirclePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(outerCirclePath, NULL, outerCircle);
    
    CGMutablePathRef innerCirclePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(innerCirclePath, NULL, innerCircle);
    
    CGMutablePathRef glossCirclePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(glossCirclePath, NULL, glossCircle);
    
    CGMutablePathRef topShadowCirclePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(topShadowCirclePath, NULL, outerCircle);
    
    // Draw shadow
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context,CGSizeMake (0.5,  0.5), 1,
                                [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5] CGColor]);
    CGContextAddPath(context, outerBorderPath);
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    CFRelease(outerBorderPath);
    
    // Draw white background
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextAddPath(context, outerCirclePath);
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    CFRelease(outerCirclePath);
    
    // Draw color subview
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [[self color] CGColor]);
    CGContextAddPath(context, innerCirclePath);
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    
    // Draw gloss shadow
    CGContextSaveGState(context);
    CGContextSetBlendMode(context, kCGBlendModePlusDarker);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1] CGColor]);
    CGContextAddPath(context, innerCirclePath);
    CGContextClip(context);
    CGContextAddPath(context, glossCirclePath);
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    
    // Draw icon in white color
    CGContextSaveGState(context);
    CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
    CGContextTranslateCTM(context, 0, avalaibleSize);
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawImage(context, imageCircle, [[self icon] CGImage]);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    CFRelease(innerCirclePath);
    CFRelease(glossCirclePath);
    
    // Draw top shadow only when button is selected
    if ([self selected]) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3] CGColor]);
        CGContextAddPath(context, topShadowCirclePath);
        CGContextEOFillPath(context);
        CGContextRestoreGState(context);
        CFRelease(topShadowCirclePath);
    }
}

- (IBAction)buttonTouched:(id)sender forEvent:(UIEvent*)event
{
    UITouch *touch = [[event allTouches] anyObject];
    // Detect event's type
    if (touch == nil ) {
        [self setSelected:NO];
    } else {
        UITouchPhase phase = [touch phase] ;
        [self setSelected:(phase != UITouchPhaseEnded &&
                           phase != UITouchPhaseCancelled)] ;
    }
    
    // Redraw button
    [self setNeedsDisplay];
}

@end
