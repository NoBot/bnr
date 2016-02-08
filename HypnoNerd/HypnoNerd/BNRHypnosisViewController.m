//
//  BNRHypnosisViewController.m
//  
//
//  Created by Hyon Sim on 1/15/16.  11:15AM
//
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

#pragma mark - <UItextFieldDelegate>
@interface BNRHypnosisViewController () <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController

#pragma mark - Load code

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    return self;
}

-(void) viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (void) loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    
    // Add text field
    CGRect textFieldRect = CGRectMake(20,120,335,30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [backgroundView addSubview:textField];
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.keyboardType = UIKeyboardTypeEmailAddress;
    textField.autocorrectionType = NO;
    
    // Set BNRHypnosisViewController as the delegate for textField
    textField.delegate = self;

    // Add a UISegmentedControl
    CGRect segmentRect = CGRectMake(20,70,335,30);
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"Red",@"Green",@"Blue"]];
    segment.frame = segmentRect;
    segment.backgroundColor = [UIColor whiteColor];
    // Prevent background color from showing in the corners
    segment.layer.cornerRadius = 5;
    segment.clipsToBounds = YES;
    [backgroundView addSubview: segment];
    
    [segment addTarget:self
                action:@selector(setCircleColor:)
      forControlEvents:UIControlEventValueChanged];
   
   
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}


#pragma mark - View specific code

-(void) setCircleColor:(id) sender
{
    UISegmentedControl *segmentControl = (UISegmentedControl *) sender;
    BNRHypnosisView *bgview = (BNRHypnosisView *) self.view;
    UIColor *newColor = [[UIColor alloc] init];
    
    switch (segmentControl.selectedSegmentIndex){
        case 0:
            newColor = [UIColor redColor];
            break;
        case 1:
            newColor = [UIColor greenColor];
            break;
        case 2:
            newColor = [UIColor blueColor];
            break;
        default:
            newColor = [UIColor grayColor];
            break;
    }
    
    [bgview setCircleColor: newColor];
}


-(BOOL) textFieldShouldReturn:(UITextView *) textField
{
    //NSLog(@"%@", textField.text);
    [self drawHypnoticMessage: textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

-(void)drawHypnoticMessage:(NSString *) message
{
    for (int i=0; i<20; i++)
    {
        UILabel *messageLabel = [[UILabel alloc]init];
        
        // Configure the label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        
        // this method resizes the lablel, which will be relative
        [messageLabel sizeToFit];
        
        // Get a random x value that fits within the hypnosis view's width
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random_uniform(width);
        
        // Get a random y value that fits within the hypnosis view's height
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random_uniform(height);
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the hierachy
        [self.view addSubview:messageLabel];
        
        // Animation Motion Effects
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-50;
        motionEffect.maximumRelativeValue = @50;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-50;
        motionEffect.maximumRelativeValue = @50;
        [messageLabel addMotionEffect:motionEffect];
    }
}



@end
