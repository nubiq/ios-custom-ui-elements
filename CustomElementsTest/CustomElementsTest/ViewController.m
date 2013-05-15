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
    
    // Add all rounded buttons as subviews
    [[self view] addSubview:_roundButton1];
    [[self view] addSubview:_roundButton2];
    [[self view] addSubview:_roundButton3];
    [[self view] addSubview:_roundButton4];
    
    
    // Init custom labels
    _letterA = [[UICustomColoredLabel alloc] initWithFrame:CGRectMake(100, 150, 26, 26)
                                             withCharacter:@"A"
                                                 withColor:UICustomColorDarkRed];
    _letterB = [[UICustomColoredLabel alloc] initWithFrame:CGRectMake(140, 150, 26, 26)
                                             withCharacter:@"B"
                                                 withColor:UICustomColorDarkYellow];
    _letterC = [[UICustomColoredLabel alloc] initWithFrame:CGRectMake(180, 150, 26, 26)
                                             withCharacter:@"C"
                                                 withColor:UICustomColorViolet];
    _letterD = [[UICustomColoredLabel alloc] initWithFrame:CGRectMake(220, 150, 26, 26)
                                             withCharacter:@"D"
                                                 withColor:[UIColor colorWithRed:0 green:0
                                                                            blue:0.3 alpha:1]];
    
    // Add all labels as subviews
    [[self view] addSubview:_letterA];
    [[self view] addSubview:_letterB];
    [[self view] addSubview:_letterC];
    [[self view] addSubview:_letterD];
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
