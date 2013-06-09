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

-(NSArray *)selection {

    NSMutableArray *selected_entries = [[NSMutableArray alloc] init];
    for (int i = 0; i < _entries.count; i += 1) {
        NSString *entry_id = [self idForRow:i];
        if ([_selection containsObject:entry_id]) {
            [selected_entries addObject: _entries[i]];
        }
    }
    return selected_entries;
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
    cell.textLabel.text = [self titleForRow:indexPath.row];

    BOOL selected = [_selection containsObject: [self idForRow:indexPath.row ]];

    if (selected) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    BOOL selected = (UITableViewCellAccessoryCheckmark == cell.accessoryType);

    NSString *entry_id = [self idForRow:indexPath.row];

    if (selected) {
        [_selection removeObject:entry_id];
    } else {
        [_selection addObject:entry_id];
    }
    
    cell.accessoryType = selected ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;

//    NSLog(@"%@", [self selection]);
}

#pragma mark helpers

-(NSString*)idForRow:(NSInteger)row {
    NSString *entry_id = [[_entries[row] lastObject] description];
    return entry_id;
}

-(NSString*)titleForRow:(NSInteger)row {
    NSString *entry_title = [_entries[row] objectAtIndex:0];
    return entry_title;
}

-(NSMutableSet *)selectionFromIds:(NSArray *) ids withCapacity:(NSUInteger) capacity{

    NSMutableSet *s = [[NSMutableSet alloc] init];

    for (NSUInteger i=0; i < ids.count; i+=1) {
        NSString *entry_id = [ids[i] description];
        [s addObject:entry_id];
    }

    return s;
}

@end
