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
    // is a list of @[id, Label] pairs
    NSMutableDictionary *_selection;
    NSArray *_entries;
    BOOL    _multiselect;

}

-(id)initWithEntries: (NSArray*)entries
     withSelectedIds: (NSArray*) selected
  andMultiselectable:(BOOL)multi
        ;

//-(id)selection;
//-(id)selectionWithLabels;

@end
