//
//  main.m
//  RandomItems
//
//  Created by Hyon Sim on 1/14/16.
//  Copyright (c) 2016 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        [items insertObject:@"Zero" atIndex:0];
        
        for (NSString *item in items){
            NSLog(@"%@", item);
        }
        
        BNRItem *item =[[BNRItem alloc]init];
        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);
        NSLog(@"%@", item);
        items = nil;
        
    }
    return 0;
}
