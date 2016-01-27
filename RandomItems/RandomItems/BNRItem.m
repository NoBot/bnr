//
//  BNRItem.m
//  
//
//  Created by Hyon Sim on 1/14/16.
//
//

#import "BNRItem.h"

@implementation BNRItem


-(instancetype) initWithItemName:(NSString *) name
              valueInDollars:(int) value
                serialNumber:(NSString *) sNumber
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self)
    {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    // Return the address of the newly initialized object
    return self;
}

-(instancetype) initWithItemName:(NSString *) name
{
    return [self initWithItemName: name
               valueInDollars:0
                 serialNumber:@""];
}

-(instancetype) init
{
    return [self initWithItemName:@"Item"];
}




-(NSString *) description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
     self.itemName,
     self.serialNumber,
     self.valueInDollars,
     self.dateCreated];
    return descriptionString;
}

@end
