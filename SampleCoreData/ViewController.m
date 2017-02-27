//
//  ViewController.m
//  SampleCoreData
//
//  Created by S@nchit on 2/11/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import "ViewController.h"
#import "AddDeviceViewController.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *contactTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contactTableView.dataSource = self;
    self.contactTableView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIButton *addContactBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [addContactBtn setTitle:@"+" forState:UIControlStateNormal];
    [addContactBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [addContactBtn addTarget:self action:@selector(addContact) forControlEvents:UIControlEventTouchDown];
    [addContactBtn setBackgroundColor:[UIColor grayColor]];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:addContactBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    //[self.view addSubview:addContactBtn];
    self.contactTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.height-50, self.view.frame.size.width)];
    [self.view addSubview:self.contactTableView];
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)addContact{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddDeviceViewController *addDeviceVC = [storyBoard instantiateViewControllerWithIdentifier:@"AddDeviceViewController"];
    [self.navigationController pushViewController:addDeviceVC animated:YES];
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    //creating a new object.
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context];
//    NSManagedObject *device = [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:context];
//    [device setValue:@"iPhone 7" forKey:@"name"];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
