//
//  BNRItem.h
//  
//
//  Created by Hyon Sim on 1/14/16.
//
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

+(instancetype) randomItem;
-(instancetype) initWithItemName:(NSString *) name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) sNumber;
-(instancetype) initWithItemName:(NSString *) name;

@property (nonatomic) BNRItem *conntainedItem;
@property (nonatomic) BNRItem *container;

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic) NSDate *dateCreated;

@end
