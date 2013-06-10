//
//  MHListPickerViewController.h
//  MHListPicker
//
//  Created by Maryan Hratson on 2013-06-08.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHListPickerViewController;

typedef void (^MHListPickerSelectCallback)(MHListPickerViewController *vc) ;

@interface MHListPickerViewController : UITableViewController
{

    // set of entry ids
    NSMutableSet *_selection;
    NSArray *_entries;
    BOOL    _multiselect;

    MHListPickerSelectCallback _selectionBlock;

}

// TODO: support single selection
-(id)initWithEntries: (NSArray*)entries
     withSelectedIds: (NSArray*) selected
  andMultiselectable:(BOOL)multi
  withSelectionBlock:(MHListPickerSelectCallback) block;

-(NSArray *)selection;

@end
