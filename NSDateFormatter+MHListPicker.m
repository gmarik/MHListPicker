//
//  NSCalendar+ListPickerEntries.m
//  MHListPicker
//
//  Created by Maryan Hratson on 2013-06-08.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import "NSDateFormatter+MHListPicker.h"

@implementation NSDateFormatter (MHListPicker)

-(NSArray *)shortWeekdaySymbolsForPicker {
    return [self symbolsForPicker:self.shortWeekdaySymbols];
}

-(NSArray *)weekdaySymbolsForPicker {
    return [self symbolsForPicker:self.weekdaySymbols];
}

-(NSArray *)symbolsForPicker:(NSArray *)symbols {

    NSMutableArray *entries = [[NSMutableArray alloc] init];

    for (int i = 0; i < symbols.count; i += 1) {
        id item = [symbols objectAtIndex: i];
        [entries addObject:@[item, @(i+1)]];
    }

    return entries;
}


@end
