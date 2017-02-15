//
//  ViewController.m
//  SampleCoreData
//
//  Created by S@nchit on 2/11/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import "ViewController.h"

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
    UIButton *addContactBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [addContactBtn setTitle:@"+" forState:UIControlStateNormal];
    [addContactBtn addTarget:self action:@selector(addContact) forControlEvents:UIControlEventTouchDown];
    [addContactBtn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:addContactBtn];
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
