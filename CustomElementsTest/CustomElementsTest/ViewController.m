//
//  ViewController.m
//  CustomElementsTest
//
//  Created by Noelia on 15/05/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init rounded buttons
    _roundButton1 = [[UICustomRoundButton alloc] initWithFrame:CGRectMake(100, 100, 20, 20)
                                                          icon:UICustomIconPrevious
                                                         color:UICustomColorBlack];
    _roundButton2 = [[UICustomRoundButton alloc] initWithFrame:CGRectMake(140, 100, 26, 26)
                                                          icon:UICustomIconRemove
                                                         color:UICustomColorTeal];
    _roundButton3 = [[UICustomRoundButton alloc] initWithFrame:CGRectMake(180, 100, 30, 30)
                                                          icon:UICustomIconSubstract
                                                         color:UICustomColorRedIOS];
    _roundButton4 = [[UICustomRoundButton alloc] initWithFrame:CGRectMake(220, 100, 26, 26)
                                                          icon:UICustomIconAdd
                                                         color:UICustomColorBlueIOS];
    
    // Set a method to launch when the button is pushed
    [_roundButton1 addTarget:self action:@selector(roundButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    
    // Add all buttons as subviews
    [[self view] addSubview:_roundButton1];
    [[self view] addSubview:_roundButton2];
    [[self view] addSubview:_roundButton3];
    [[self view] addSubview:_roundButton4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Buttons

- (IBAction)roundButtonClicked:(id)sender
{
    NSLog(@"Clicked round button");
}

@end
