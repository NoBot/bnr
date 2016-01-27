//
//  BNRTextBoxViewController.m
//  
//
//  Created by Hyon Sim on 1/18/16.
//
//


#import "BNRTextBoxViewController.h"
#import "BNRHypnosisView.h"
#import <UIKit/UIKit.h>

@implementation BNRTextBoxViewController

-(void) viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRTextBoxViewController loaded its view.");
}


-(IBAction)closeView:(id)sender
{
    NSLog(@"Close view pressed.");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)sendMessage:(id)sender
{
    NSLog(@"Send Message pressed.");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
