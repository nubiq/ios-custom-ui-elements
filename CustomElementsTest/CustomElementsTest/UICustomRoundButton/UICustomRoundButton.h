//
//  UICustomRoundButton.h
//  Prueba boton
//
//  Created by Juanma Coello on 22/01/13.
//  Copyright (c) 2013 BebeInnova S.L. All rights reserved.
//
// Code in this file:
// - Juanma Coello <juanma@nubiq.es>
// - Noelia Sales <noelia@nubiq.es>

#import <UIKit/UIKit.h>

// Customized icons macros
#define UICustomIconAdd        @"add_icon.png"
#define UICustomIconSubstract  @"substract_icon.png"
#define UICustomIconEdit       @"glyphicons_edit_pencil.png"
#define UICustomIconPlay       @"glyphicons_play.png"
#define UICustomIconRemove     @"glyphicons_remove.png"
#define UICustomIconZoomIn     @"glyphicons_zoom_in.png"
#define UICustomIconZoomOut    @"glyphicons_zoom_out.png"
#define UICustomIconNext       @"glyphicons_next_chevron.png"
#define UICustomIconPrevious   @"glyphicons_previous_chevron.png"
#define UICustomIconInfo       @"info_icon.png"

// Customized colors macros
#define UICustomColorBlack [UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f]
#define UICustomColorDarkRed [UIColor colorWithRed:0.71f green:0.01f blue:0.01f alpha:1.0f]
#define UICustomColorRed [UIColor colorWithRed:1.0f green:0 blue:0 alpha:1.0f]
#define UICustomColorPink [UIColor colorWithRed:1.0f green:0 blue:0 alpha:1.0f]
#define UICustomColorTeal [UIColor colorWithRed:0 green:0.5f blue:0.5f alpha:1.0f]
#define UICustomColorGreen [UIColor colorWithRed:0 green:0.5f blue:0 alpha:1.0f]
#define UICustomColorBrightGreen [UIColor colorWithRed:0 green:1.0f blue:0 alpha:1.0f]
#define UICustomColorTurquoise [UIColor colorWithRed:0 green:1.0f blue:1.0f alpha:1.0f]
#define UICustomColorDarkBlue [UIColor colorWithRed:0 green:0 blue:0.5f alpha:1.0f]
#define UICustomColorViolet [UIColor colorWithRed:0.5f green:0 blue:0.5f alpha:1.0f]
#define UICustomColorBlue [UIColor colorWithRed:0 green:0 blue:1.0f alpha:1.0f]
#define UICustomColorLightGray [UIColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f]
#define UICustomColorGray [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]
#define UICustomColorDarkYellow [UIColor colorWithRed:0.5f green:0.5f blue:0 alpha:1.0f]
#define UICustomColorYellow [UIColor colorWithRed:1.0f green:1.0f blue:0 alpha:1.0f]
#define UICustomColorWhite [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]
#define UICustomColorBlueIOS [UIColor colorWithRed:0.392f green:0.6f blue:0.89f alpha:1.0f]
#define UICustomColorRedIOS [UIColor colorWithRed:0.81f green:0 blue:0 alpha:1.0f]


/**
 * Special class to create customized buttons in iOS style.
 */ 
@interface UICustomRoundButton : UIButton <UIGestureRecognizerDelegate>

/**
 * Main color of the button.
 */
@property (nonatomic) UIColor *color;

/**
 * Image showed in the center of the button.
 */
@property (nonatomic) UIImage *icon;

/**
 *
 */
@property BOOL selected;

// METHODS

/**
 * Init button with a given frame. Icon and color are assigned by default.
 */
- (id)initWithFrame:(CGRect)frame;

/**
 * Init button with a given frame and icon. Color is assigned by default.
 */
- (id)initWithFrame:(CGRect)frame icon:(NSString *)iconName;

/**
 * Init button with a given frame, icon and color.
 */
- (id)initWithFrame:(CGRect)frame icon:(NSString *)iconName color:(UIColor *)color;

/**
 * Method called when touching the button.
 *
 * It has to redraw the button when the event is correct.
 * To add another selector to the customized button, you have to declare it like this:
 *
 * [button1 addTarget:self action:@selector(method:)
 *   forControlEvents:UIControlEvent...];
 *
 * And define the method: - (IBAction)method:(id)sender;
 */
- (IBAction)buttonTouched:(id)sender forEvent:(UIEvent *)event;

@end
