//
//  UINumericKeyboard.m
//  procyon
//
//  Created by Juanma Coello on 24/04/13.
//  Copyright (c) 2013 BebeInnova S.L. All rights reserved.
//
// Code in this file:
// - Juanma Coello <juanma@nubiq.es>
// - Noelia Sales <noelia@nubiq.es>

#import "UINumericKeyboard.h"
#import "UICustomTextButton.h"

@interface UINumericKeyboard ()

@property (nonatomic) id target;

@property (nonatomic) SEL selector;

@property (nonatomic) UILabel *label;

@end

@implementation UINumericKeyboard

@synthesize variable;

id lastSender;

#pragma mark - Object lifecycle

- (id)initFromView:(UIView *)view
{
    UIViewController *keyboardViewController = [[UIViewController alloc] init];
    [keyboardViewController setContentSizeForViewInPopover:CGSizeMake(340, 370)];
    
    variable = [NSNumber numberWithInt:0];
    
    // Set labels
    labelVar = [[UILabel alloc] init];
    [labelVar setFrame:CGRectMake(10, 10, 320, 50)];
    [labelVar setFont:[UIFont systemFontOfSize:40]];
    [labelVar setTextColor:[UIColor whiteColor]];
    [labelVar setBackgroundColor:[UIColor clearColor]];
    [labelVar setTextAlignment:NSTextAlignmentRight];
    [labelVar setText:[variable stringValue]];
    
    int offset = 7;
    int buttonWidth = 110;
    int buttonHeight = 60;
    
    // Set customized buttons
    UICustomTextButton *button1 = [[UICustomTextButton alloc] initWithText:@"1"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button1 setTag:1];
    [button1 setFrame:CGRectMake(offset, labelVar.frame.size.height + offset, buttonWidth, buttonHeight)];
    
    UICustomTextButton *button2 = [[UICustomTextButton alloc] initWithText:@"2"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button2 setTag:2];
    [button2 setFrame:CGRectMake(button1.frame.origin.x + button1.frame.size.width,
                                 labelVar.frame.size.height + offset, buttonWidth, buttonHeight)];
    
    UICustomTextButton *button3 = [[UICustomTextButton alloc] initWithText:@"3"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button3 setTag:3];
    [button3 setFrame:CGRectMake(button2.frame.origin.x + buttonWidth,
                                 labelVar.frame.size.height + offset, buttonWidth, buttonHeight)];
    
    UICustomTextButton *button4 = [[UICustomTextButton alloc] initWithText:@"4"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button4 setTag:4];
    [button4 setFrame:CGRectMake(offset, button1.frame.origin.y + buttonHeight,
                                 buttonWidth, buttonHeight)];
    
    UICustomTextButton *button5 = [[UICustomTextButton alloc] initWithText:@"5"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button5 setTag:5];
    [button5 setFrame:CGRectMake(button1.frame.origin.x + buttonWidth,
                                 button1.frame.origin.y + buttonHeight,
                                 buttonWidth, buttonHeight)];
    
    UICustomTextButton *button6 = [[UICustomTextButton alloc] initWithText:@"6"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button6 setTag:6];
    [button6 setFrame:CGRectMake(button2.frame.origin.x + buttonWidth,
                                 button1.frame.origin.y + buttonHeight,
                                 buttonWidth, buttonHeight)];
    
    UICustomTextButton *button7 = [[UICustomTextButton alloc] initWithText:@"10"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button7 setTag:10];
    [button7 setFrame:CGRectMake(offset, button4.frame.origin.y + buttonHeight,
                                 buttonWidth, buttonHeight)];
    
    UICustomTextButton *button8 = [[UICustomTextButton alloc] initWithText:@"12"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button8 setTag:12];
    [button8 setFrame:CGRectMake(button1.frame.origin.x + buttonWidth,
                                 button4.frame.origin.y + buttonHeight ,
                                 buttonWidth, buttonHeight)];
    
    UICustomTextButton *button9 = [[UICustomTextButton alloc] initWithText:@"20"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button9 setTag:20];
    [button9 setFrame:CGRectMake(button2.frame.origin.x + buttonWidth,
                                 button4.frame.origin.y + buttonHeight,
                                 buttonWidth, buttonHeight)];
    
    UICustomTextButton *button10 = [[UICustomTextButton alloc] initWithText:@"25"
                                                                     target:self
                                                                   selector:@selector(tapButton:)];
    [button10 setTag:25];
    [button10 setFrame:CGRectMake(offset, button7.frame.origin.y + buttonHeight,
                                  buttonWidth, buttonHeight)];
    
    UICustomTextButton *button11 = [[UICustomTextButton alloc] initWithText:@"50"
                                                                     target:self
                                                                   selector:@selector(tapButton:)];
    [button11 setTag:50];
    [button11 setFrame:CGRectMake(button1.frame.origin.x + buttonWidth,
                                  button7.frame.origin.y + buttonHeight,
                                  buttonWidth, buttonHeight)];
    
    UICustomTextButton *button12 = [[UICustomTextButton alloc] initWithText:@"100"
                                                                    target:self
                                                                  selector:@selector(tapButton:)];
    [button12 setTag:100];
    [button12 setFrame:CGRectMake(button2.frame.origin.x + buttonWidth,
                                  button7.frame.origin.y + buttonHeight,
                                  buttonWidth, buttonHeight)];
    
    UICustomTextButton *buttonC = [[UICustomTextButton alloc] initWithTextAndHSB:@"C"
                                                                          target:self
                                                                        selector:@selector(tapButton:)
                                                                             hue:0
                                                                      saturation:1
                                                                      brightness:0.38f];
    [buttonC setTag:0];
    [buttonC setFrame:CGRectMake(offset, button10.frame.origin.y + buttonHeight,
                                 2*buttonWidth, buttonHeight)];
    
    UICustomTextButton *buttonOK = [[UICustomTextButton alloc] initWithTextAndHSB:@"OK"
                                                                           target:self
                                                                         selector:@selector(tapButton:)
                                                                              hue:0.075f
                                                                       saturation:0.9f
                                                                       brightness:0.96f];
    [buttonOK setTag:-1];
    [buttonOK setFrame:CGRectMake(button2.frame.origin.x + buttonWidth,
                                  button10.frame.origin.y + buttonHeight,
                                  buttonWidth, buttonHeight)];
    
    // Add labels to view
    [[keyboardViewController view] addSubview:labelVar];
    
    // Add buttons to view
    [[keyboardViewController view] addSubview:button1];
    [[keyboardViewController view] addSubview:button2];
    [[keyboardViewController view] addSubview:button3];
    [[keyboardViewController view] addSubview:button4];
    [[keyboardViewController view] addSubview:button5];
    [[keyboardViewController view] addSubview:button6];
    [[keyboardViewController view] addSubview:button7];
    [[keyboardViewController view] addSubview:button8];
    [[keyboardViewController view] addSubview:button9];
    [[keyboardViewController view] addSubview:button10];
    [[keyboardViewController view] addSubview:button11];
    [[keyboardViewController view] addSubview:button12];
    [[keyboardViewController view] addSubview:buttonC];    
    [[keyboardViewController view] addSubview:buttonOK];
    
    // Adding background
    [[keyboardViewController view] setBackgroundColor:[UIColor colorWithRed:64.0/255
                                                                      green:70.0/255
                                                                       blue:80.0/255
                                                                      alpha:1]];
    
    return [super initWithContentViewController:keyboardViewController];
}

- (id)initFromView:(UIView *)view withTarget:(id)target withSelector:(SEL)selector
{
    _target = target;
    _selector = selector;
    return [self initFromView:view];
}


#pragma mark - Gestures

- (void)tapButton:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    switch ([buttonPressed tag]){
        case 0:
        {
            variable = [NSNumber numberWithInt:0];
            [labelVar setText:@"0"];
        }
        break;
        case -1:
        {
            if (_target != nil) {
                NSLog(@"1");
                // Ignore warning
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [_target performSelector:_selector];
#pragma clang diagnostic pop
                NSLog(@"2");
            }
            [self dismissPopoverAnimated:YES];
            
            NSLog(@"3");
        }
        break;
        default:
            variable = [NSNumber numberWithInt:([variable integerValue] + [buttonPressed tag])];
            [labelVar setText:[variable stringValue]];
    }
}

#pragma mark - Popover

- (void)presentPopover:(id)sender
{
    [self presentPopoverFromRect:[sender bounds]
                          inView:sender
        permittedArrowDirections:UIPopoverArrowDirectionAny
                        animated:YES];
}

- (void)dismiss
{
    if ([self isPopoverVisible]) {
        [self dismissPopoverAnimated:YES];
    }
}


@end
