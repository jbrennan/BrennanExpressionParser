//
//  EXPRuntimeFunction.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-09-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPRuntimeFunction.h"

@interface EXPRuntimeFunction ()
@property NSString *identifierName;
@property (copy) EXPRuntimeFunctionBlock functionBlock;
@end


@implementation EXPRuntimeFunction


+ (instancetype)newWithIdentifierName:(NSString *)identifierName functionBlock:(EXPRuntimeFunctionBlock)functionBlock {
	return [[[self class] alloc] initWithIdentifierName:identifierName functionBlock:functionBlock];
}


- (instancetype)initWithIdentifierName:(NSString *)identifierName functionBlock:(EXPRuntimeFunctionBlock)functionBlock {
	self = [super init];
	if (self) {
		self.identifierName = identifierName;
		self.functionBlock = functionBlock;
	}
	
	return self;
}


- (double)evaluateWithArguments:(NSArray *)arguments {
	if (self.functionBlock) return self.functionBlock(arguments);
	
	return 0;
}


#pragma mark - TODO

- (NSString *)documentation {
	return nil;
}


- (id)visualization {
	return nil;
}

@end
