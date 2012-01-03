//
//  NSArray+Permutation.h
//  permutation
//
//  Created by Dominic Chang on 1/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PermutateActionBlock)(NSArray * permutedArray);

@interface NSArray (Permutation)

/**
 Using PermutateActionBlock to iterate through all permutation 
 of the current NSArray. Duplicate items is consider the same
 please customize isEqual and compare accordingly when it is needed.
 */
- (void)permutation:(PermutateActionBlock)permutateAction;

@end
