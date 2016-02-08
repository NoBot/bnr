//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Hyon Sim on 4/22/15.
//  Copyright (c) 2015 bWERX. All rights reserved.
//

#import "BNRHypnosisView.h"

// Class Extension
@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end


// Class implementation
@implementation BNRHypnosisView

-(instancetype) initWithFrame:(CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    // Figure out the center of the bounds rectangle
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];

    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius-=20)
    {
        [path moveToPoint: CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI*2.0
                     clockwise:YES];
        
    }

    [path stroke];
    
    // Insert an image
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    
    CGRect logobounds = bounds;
    logobounds.size.height = bounds.size.width * 0.9;
    logobounds.size.width = logobounds.size.height;
    logobounds.origin.x = bounds.size.width / 2.0 - logobounds.size.width / 2.0;
    logobounds.origin.y = bounds.size.height / 2.0 - logobounds.size.height / 2.0;
    [logoImage drawInRect: logobounds];
    
    
}

// Override event
// When a finger touches the screen
-(void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
    NSLog(@"%@ was touched", self);
    
    // Get 3 random numbers between 0 and 1
    float red = arc4random_uniform(100) / 100.0;
    float green = arc4random_uniform(100) / 100.0;
    float blue = arc4random_uniform(100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha: 1.0];
    self.circleColor = randomColor;
}

-(void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
