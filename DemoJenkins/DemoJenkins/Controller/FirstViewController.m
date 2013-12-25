//
//  FirstViewController.m
//  DemoJenkins
//
//  Created by QuangPC on 12/25/13.
//  Copyright (c) 2013 quangpc. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"First";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)executeTask:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
