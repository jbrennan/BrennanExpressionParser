//
//  EXPNode.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPNode.h"

@implementation EXPNode

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree {
	return [super init];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@ %f>", NSStringFromClass([self class]), self.value];
}

@end
