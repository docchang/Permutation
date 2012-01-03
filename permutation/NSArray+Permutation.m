//
//  NSArray+Permutation.m
//  permutation
//
//  Created by Dominic Chang on 1/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Permutation.h"

@implementation NSArray (Permutation)

- (void)permutateHelper:(NSMutableArray *)mutaArray 
			  rootIndex:(int)rootIndex
		permutateAction:(PermutateActionBlock)permutateAction {
	
	if (rootIndex == mutaArray.count) {
		if (permutateAction) {
			permutateAction([NSArray arrayWithArray:mutaArray]);
		}
		return;
	}
	
	//init swap
	id lastSwappedObj;

	for (int i = rootIndex; i < mutaArray.count; i++) {

		//skip if same object
		if ([lastSwappedObj isEqual:[mutaArray objectAtIndex:i]]) {
			continue;
		}
		
		//remember last swapped object
		lastSwappedObj = [mutaArray objectAtIndex:i];
		
		//swap
		[mutaArray exchangeObjectAtIndex:i withObjectAtIndex:rootIndex];
		
		//recursive call
		[self permutateHelper:mutaArray
					rootIndex:rootIndex + 1
			  permutateAction:permutateAction];
		
		//swap back
		[mutaArray exchangeObjectAtIndex:i withObjectAtIndex:rootIndex];
	}
}

- (void)permutation:(PermutateActionBlock)permutateAction {
	if (self.count == 0) {
		return;
	}
	
	//sort the array to avoid duplication
	//over write the compare function if customization is needed
	[self permutateHelper:[NSMutableArray arrayWithArray:[self sortedArrayUsingSelector:@selector(compare:)]]
				rootIndex:0
		  permutateAction:permutateAction];
}

@end
