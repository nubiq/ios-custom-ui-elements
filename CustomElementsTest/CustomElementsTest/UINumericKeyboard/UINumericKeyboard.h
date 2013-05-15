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

/**
 * This keyboard is a specialization of UIPopoverController, so it won't
 * work in iPhone devices.
 *
 * As stated in Apple'd documentation:
 *    "Popover controllers are for use exclusively on iPad devices."
 *
 * Ref: http://developer.apple.com/library/ios/#documentation/uikit/reference/UIPopoverController_class/Reference/Reference.html
 */
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
 * Init the keyboard by default in a given view.
 */
- (id)initFromView:(UIView *)viewn;

/**
 * Init the keyboard from a label with a given selector and target.
 */
- (id)initFromView:(UIView *)view withTarget:(id)target withSelector:(SEL)selector;

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

