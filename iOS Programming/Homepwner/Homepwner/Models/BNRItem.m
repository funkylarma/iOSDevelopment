//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Adam Chamberlin on 18/06/2013.
//  Copyright (c) 2013 Stour Valley Designs. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName, containedItem, container, serialNumber, valueInDollars, dateCreated;

#pragma mark -
#pragma mark Class Methods

+ (id)randomItem
{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0'+ rand() % 10, 'A' + rand() % 26, '0' + rand() % 10, 'A' + rand() % 10, '0' + rand() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}

#pragma mark - Initialisers

// Designated Initialiser
- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initialiser
    self = [super init];
    
    // Did the superclass's designated initialiser succeed?
    if (self) {
        
        // Give the instance variables initial values
        [self setItemName:name];
        [self setValueInDollars:value];
        [self setSerialNumber:sNumber];
        dateCreated = [[NSDate alloc] init];
    }
    
    // Return the address of the newly initlised object
    return self;
}

- (id)init
{
    return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
}

- (id)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

#pragma mark - Memory Management

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

#pragma mark - Custom Getters and Setters

- (void)setContainedItem:(BNRItem *)i
{
    containedItem = i;
    [i setContainer:self];
}

#pragma mark - Over-rides

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", itemName, serialNumber, valueInDollars, dateCreated];
    return descriptionString;
}

@end
