//
//  BNRReminderViewController.m
//  
//
//  Created by Hyon Sim on 1/18/16.
//
//

#import "BNRReminderViewController.h"
#import "BNRTextBoxViewController.h"

@interface BNRReminderViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
        
        // Create a UIImage from a file
        // This will use Time@2x.pn on retina display devices
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    // This load everytime the view appears
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow: 60];
}

-(void) viewDidLoad
{
    // This load once
    
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view.");
}

-(IBAction)showOtherView:(id)sender
{
    NSLog(@"Show other view pressed.");
    
    BNRTextBoxViewController *tvc = [[BNRTextBoxViewController alloc] init];
    //[self presentViewController: tvc animated:YES completion:nil];
    [self presentViewController: tvc animated:YES completion:nil];
    
    /*
     
     PlayerViewController *lvc = [storyboard instantiateViewControllerWithIdentifier:@"player"];
     lvc.fromFeed = TRUE;
     lvc.play_url = [NSURL URLWithString:house.house_aws_video_id];
     
     [self presentViewController:lvc animated:YES completion:nil];
     
     */
}


-(IBAction)addReminder:(id)sender
{
    // ---------------------------------------
    // GET ACCESS TO LOCAL NOTIFICATIONS FIRST
    // Define a notification settings instance to pass as argument
    // Note settings
    UIUserNotificationSettings *noteSettings =
        [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:[NSSet set]];
    // Register with the type of alerts for your app with Notification Settings
    [[UIApplication sharedApplication] registerUserNotificationSettings: noteSettings];
    // We now have access
    // ---------------------------------------
    
    // Schedule the notification
    UILocalNotification *note = [[UILocalNotification alloc] init];
    NSDate *date = self.datePicker.date;
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    [[UIApplication sharedApplication] scheduleLocalNotification: note];
}




@end
