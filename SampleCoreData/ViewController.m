//
//  ViewController.m
//  SampleCoreData
//
//  Created by S@nchit on 2/11/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import "ViewController.h"
#import "AddDeviceViewController.h"
#import "AppDelegate.h"
#import "DeviceTableViewCell.h"
#import <CoreData/CoreData.h>

#define App_Delegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *contactTableView;
@property (strong) NSMutableArray *devicesArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *addContactBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [addContactBtn setTitle:@"+" forState:UIControlStateNormal];
    [addContactBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [addContactBtn addTarget:self action:@selector(addContact) forControlEvents:UIControlEventTouchDown];
    [addContactBtn setBackgroundColor:[UIColor grayColor]];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:addContactBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    //[self.view addSubview:addContactBtn];
    self.contactTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.height-50, self.view.frame.size.width)];
    self.contactTableView.dataSource = self;
    self.contactTableView.delegate = self;
    [self.view addSubview:self.contactTableView];
    self.devicesArray = [self fetchDevices];
    [self.contactTableView registerNib:[UINib nibWithNibName:@"DeviceTableViewCell" bundle:nil] forCellReuseIdentifier:@"DeviceTableViewCell"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(NSMutableArray *)fetchDevices{
    NSMutableArray *devices = [[NSMutableArray alloc]init];
    NSManagedObjectContext *context = App_Delegate.managedObjectContext;
    if (context){
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        
        NSError *error;
        
        NSMutableArray *responseArray= [[NSMutableArray alloc] initWithArray:[App_Delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error]];
        devices = responseArray;
        //NSLog(@"%@",[responseArray class]);
    }
    return devices;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.devicesArray && self.devicesArray.count)
        return self.devicesArray.count;
    return 0;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceTableViewCell" forIndexPath:indexPath];
    NSManagedObject *device = [self.devicesArray objectAtIndex:indexPath.row];
    [cell bindData:[device valueForKey:@"name"]];
    
    return cell;
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
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = App_Delegate;
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
