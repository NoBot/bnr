//
//  BNRMainViewController.m
//  Hypnosister
//
//  Created by Hyon Sim on 2/5/16.
//  Copyright © 2016 bWERX. All rights reserved.
//

#import "BNRMainViewController.h"
#import "BNRHypnosisView.h"

@interface BNRMainViewController ()

@property (strong,nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) IBOutlet UIButton *buttonOne;
@property (strong, nonatomic) UIColor *circleColor;

@end


@implementation BNRMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect screenRect = self.view.frame;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    
    // Add first view
    BNRHypnosisView *hview1 = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [self.scrollView addSubview:hview1];
    
    // Add second view
    screenRect.origin.x += screenRect.size.width;
    BNRHypnosisView *hview2 = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [self.scrollView addSubview: hview2];
    
    self.scrollView.contentSize = bigRect.size;
}


@end
