//
//  TableViewController.h
//  leiseca
//
//  Created by Helena on 6/9/14.
//  Copyright (c) 2014 Lei Seca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Evento.h"

@interface TableViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * json;
@property (nonatomic, strong) NSMutableArray *BolsList;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UIView *nomatchesView;

- (void) retrieveData;

@end
