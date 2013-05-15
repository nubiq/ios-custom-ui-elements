//
//  UICustomColoredLabel.h
//  procyon
//
//  Created by Noelia on 30/04/13.
//  Copyright (c) 2013 BebeInnova S.L. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import <UIKit/UIKit.h>

@interface UICustomColoredLabel : UILabel

#pragma mark - Custom attributes

/**
 * Main color of the label.
 */
@property (nonatomic) UIColor *color;

/**
 * Character showed in the center of the label.
 */
@property (nonatomic) NSString *character;

#pragma mark - Object lifecycle

/**
 * Init custom label with a given frame, character and color.
 */
- (id)initWithFrame:(CGRect)frame withCharacter:(NSString *)newCharacter withColor:(UIColor *)newColor;

@end
