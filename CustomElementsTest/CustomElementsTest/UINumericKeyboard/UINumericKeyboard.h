//
//  UINumericKeyboard.h
//  procyon
//
//  Created by Juanma Coello on 24/04/13.
//  Copyright (c) 2013 BebeInnova S.L. All rights reserved.
//
// Code in this file:
// - Juanma Coello <juanma@nubiq.es>
// - Noelia Sales <noelia@nubiq.es>

#import <UIKit/UIKit.h>

@interface UINumericKeyboard : UIPopoverController {
    /**
     * Quantity label.
     */
    UILabel *labelVar;
}

#pragma mark - Attributes

/**
 * Quantity value.
 */
@property (nonatomic) NSNumber *variable;


#pragma mark - Object lifecycle

/**
 * Init the keyboard by default in a give label.
 */
- (id)initFromLabel:(UILabel *)label;

/**
 * Init the keyboard from a label with a given selector and target.
 */
- (id)initFromLabel:(UILabel *)label withTarget:(id)target withSelector:(SEL)selector;

#pragma mark - Popover

/**
 * Show the keyboard.
 */
- (void)presentPopover:(id)sender;

/**
 * Hide the keyboard.
 */
- (void)dismiss;

@end

