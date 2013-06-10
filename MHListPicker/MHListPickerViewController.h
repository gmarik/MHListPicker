//
//  MHListPickerViewController.h
//  MHListPicker
//
//  Created by Maryan Hratson on 2013-06-08.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHListPickerViewController : UITableViewController
{
    // set of entry ids
    NSMutableSet *_selection;
    NSArray *_entries;
    BOOL    _multiselect;

}

// TODO: support single selection
-(id)initWithEntries: (NSArray*)entries
     withSelectedIds: (NSArray*) selected
  andMultiselectable:(BOOL)multi;

-(NSArray *)selection;

@end
