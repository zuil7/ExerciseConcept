//
//  ViewController.m
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import "ViewController.h"
#import "APIObject.h"
#import "DataInfoCell.h"

@interface ViewController ()
@property(nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Facts";
    self.HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    self.HUD.labelText = @"Retrieving ...";
    //self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    //[self.view addSubview:self.HUD];
    self.HUD.delegate = self;
    [self.HUD show:YES];
	// Do any additional setup after loading the view, typically from a nib.
    self.dataArr=[[NSMutableArray alloc] init];
    [ServiceLayer sharedInstance].delegate = self;
    [[ServiceLayer sharedInstance] requestAllData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////////////
#pragma mark - Tableview Source
////////////////////////////////
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArr count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *CellIdentifier = @"Cell";
    DataInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    [cell bind:self.dataArr Idx:indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
}

- (void) serviceRequestDidFinished:(APITYPE) apiType withInfo:(id) info
{
    APIObject *apiObject = (APIObject *) info;
    NSLog(@"apiObject %@",apiObject);
    self.dataArr=apiObject.m_object;
     NSLog(@"dataArr %@",self.dataArr);
    [self.dataTbl reloadData];
     self.navigationItem.title = apiObject.dTitle;
    [self.HUD hide:YES];
    
}
- (void) serviceRequestDidFailed:(APITYPE) apiType withInfo:(id) info
{
   
}

@end
