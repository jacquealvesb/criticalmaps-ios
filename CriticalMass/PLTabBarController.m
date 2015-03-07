#import "PLTabBarController.h"
#import "PLMapViewController.h"
#import "PLRulesViewController.h"
#import "PLChatViewController.h"
#import "PLTwitterViewController.h"
#import "PLSettingsTableViewController.h"


@interface PLTabBarController ()

@end

@implementation PLTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *viewController1 = [[PLMapViewController alloc] init];
    UIViewController *viewController2 = [[PLRulesViewController alloc] init];
    UIViewController *viewController3 = [[PLChatViewController alloc] init];
    UIViewController *viewController4 = [[PLTwitterViewController alloc] init];
    UIViewController *viewController5 = [[PLSettingsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    viewController1.title = @"Karte";
    viewController2.title = @"Knigge";
    viewController3.title = @"Chat";
    viewController4.title = @"Twitter";
    viewController5.title = @"Settings";
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:viewController1];
    [tabViewControllers addObject:viewController2];
    [tabViewControllers addObject:viewController3];
    [tabViewControllers addObject:viewController4];
    [tabViewControllers addObject:viewController5];
    
    viewController1.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"Map"] tag:1];
    viewController2.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Knigge" image:[UIImage imageNamed:@"List"] tag:2];
    viewController3.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Chat" image:[UIImage imageNamed:@"Bubble"] tag:3];
    viewController4.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Twitter" image:[UIImage imageNamed:@"Twitter"] tag:4];
    viewController5.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"Settings"] tag:5];
    
    [self setViewControllers:tabViewControllers animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
