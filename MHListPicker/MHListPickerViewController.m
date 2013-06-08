//
//  MHListPickerViewController.m
//  MHListPicker
//
//  Created by Maryan Hratson on 2013-06-08.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import "MHListPickerViewController.h"

@interface MHListPickerViewController ()

@end

@implementation MHListPickerViewController

-(id)initWithEntries: (NSArray *) entries
     withSelectedIds: (NSArray *) selected
  andMultiselectable:(BOOL) multi {

    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        _entries = entries;
        _multiselect = multi;
        _selection = [self selectionFromIds: selected withCapacity: _entries.count ];
    }

    [self.tableView registerClass: UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    return self;
}

-(NSMutableArray *)selectionFromIds:(NSArray *) ids withCapacity:(NSUInteger) capacity{

    NSMutableArray * selection = [[NSMutableArray alloc] initWithCapacity: capacity];

    for (int i=0; i<ids.count; i+=1) {
        [selection setObject:[NSNumber numberWithBool:YES] atIndexedSubscript:i];
    }

    return selection;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    cell.selectionStyle = UITableViewCellStyleDefault;
    cell.textLabel.text = [_entries[indexPath.row] lastObject];

    if (YES == [_selection[indexPath.row] boolValue]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    BOOL selected = (UITableViewCellAccessoryCheckmark == cell.accessoryType);

    cell.accessoryType = selected ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;

    [_selection setObject:[NSNumber numberWithBool:!selected] atIndexedSubscript: indexPath.row ];
}


@end
