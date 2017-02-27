//
//  AddDeviceViewController.m
//  SampleCoreData
//
//  Created by S@nchit on 2/27/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import "AddDeviceViewController.h"
#import <CoreData/CoreData.h>

@interface AddDeviceViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextfield;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation AddDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view.
}

-(void)setUpView{
    self.saveBtn.layer.cornerRadius = self.saveBtn.frame.size.height/2;
    self.saveBtn.layer.borderWidth = 1.09f;
    self.saveBtn.layer.borderColor = [UIColor blueColor].CGColor;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)saveBtnTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
