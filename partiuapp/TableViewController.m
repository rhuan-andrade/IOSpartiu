//
//  TableViewController.m
//  leiseca
//
//  Created by Helena on 6/9/14.
//  Copyright (c) 2014 Lei Seca. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"

@interface TableViewController ()

@end

#define getDataURL @"http://www.partiuapp.com.br/bols/list"

@implementation TableViewController
@synthesize json, BolsList, myTableView, nomatchesView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createNoResultsLabel];
    
    NSDateFormatter *DateFormatter = [[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    // Set Title
    self.title = [NSString stringWithFormat:@"%@ - %@", @"#ResumoBOLS", [DateFormatter stringFromDate:[NSDate date]]];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                               target:self
                               action:@selector(refresh:)];
    self.navigationItem.rightBarButtonItem = button;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self retrieveData];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(refresh:)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return BolsList.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    static NSString *cellIdentifier = @"TableCell";
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Bols * bols = [BolsList objectAtIndex:indexPath.row];
    
    cell.Bairro.text = bols.bolsBairro;
    cell.Referencia.text = bols.bolsReferencia;
    cell.Rua.text = bols.bolsRua;
    cell.Sentido.text = [NSString stringWithFormat:@"%@ %@", @"Sentido:", bols.bolsSentido];
    
    return cell;
}
*/
- (IBAction)refresh:(id)sender
{
    [self retrieveData];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    NSDateFormatter *DateFormatter = [[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    // Set Title
    self.title = [NSString stringWithFormat:@"%@ - %@", @"#ResumoBOLS", [DateFormatter stringFromDate:[NSDate date]]];
    
}

- (void) createNoResultsLabel
{
    nomatchesView = [[UIView alloc] initWithFrame:self.view.frame];
    nomatchesView.backgroundColor = [UIColor clearColor];
    
    UILabel *matchesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,320,320)];
    matchesLabel.font = [UIFont boldSystemFontOfSize:18];
    matchesLabel.numberOfLines = 1;
    matchesLabel.shadowColor = [UIColor lightTextColor];
    matchesLabel.textColor = [UIColor darkGrayColor];
    matchesLabel.shadowOffset = CGSizeMake(0, 1);
    matchesLabel.backgroundColor = [UIColor clearColor];
    matchesLabel.textAlignment =  NSTextAlignmentCenter;
    
    //Here is the text for when there are no results
    matchesLabel.text = @"Nenhuma #Bols no momento";
    
    
    nomatchesView.hidden = YES;
    [nomatchesView addSubview:matchesLabel];
    [self.myTableView insertSubview:nomatchesView belowSubview:self.myTableView];
    
}
/*
- (void) retrieveData
{
    NSURL * url = [NSURL URLWithString:getDataURL];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    BolsList = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < json.count; i++)
    {
        //Create city object
        NSString * bID = [[json objectAtIndex:i] objectForKey:@"id"];
        NSString * bBairro = [[json objectAtIndex:i] objectForKey:@"bairro"];
        NSString * bReferencia = [[json objectAtIndex:i] objectForKey:@"referencia"];
        NSString * bRua = [[json objectAtIndex:i] objectForKey:@"rua"];
        NSString * bSentido = [[json objectAtIndex:i] objectForKey:@"sentido"];
        
        Bols * bols = [[Bols alloc]initWithBolsID:bID andBolsBairro:bBairro andBolsReferencia:bReferencia andBolsRua:bRua andBolsSentido:bSentido];
        
        [BolsList addObject:bols];
    }
    
    
    [self.myTableView reloadData];
    
    //If there is no table data, unhide the "No matches" view
    if(BolsList.count == 0) {
        nomatchesView.hidden = NO;
    } else {
        nomatchesView.hidden = YES;
    }
    
    
}
*/

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 */

@end
