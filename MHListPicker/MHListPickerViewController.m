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

-(NSMutableDictionary *)selectionFromIds:(NSArray *) ids withCapacity:(NSUInteger) capacity{

    NSMutableDictionary *s = [[NSMutableDictionary alloc] init];

    for (NSUInteger i=0; i < ids.count; i+=1) {
        NSString *entry_id = [ids[i] description];
        [s setValue:[NSNumber numberWithBool: YES] forKey: entry_id];
    }

    return s;
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

    BOOL selected = [[_selection objectForKey: [self idForRow:indexPath.row ] ] boolValue];

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

    cell.accessoryType = selected ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;

    [_selection setValue:[NSNumber numberWithBool:!selected] forKey:[self idForRow:indexPath.row]];
}

-(NSString*)idForRow:(NSInteger)row {
    NSString *entry_id = [[_entries[row] objectAtIndex:0] description];
    return entry_id;
}

-(NSString*)titleForRow:(NSInteger)row {
    NSString *entry_title = [_entries[row] lastObject];
    return entry_title;
}


@end
