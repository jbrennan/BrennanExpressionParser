//
//  EXPIDNode.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-08-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPIDNode.h"
#import "EXPGrammar.h"
#import "EXPParser.h"

@implementation EXPIDNode


- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree {
	self = [super init];
	
	if (self) {
		NSLog(@"IDNode initWithSyntaxTree: %@", syntaxTree);
		
		CPIdentifierToken *token = [syntaxTree valueForTag:EXPGrammarTagIdentifier];
		self.name = token.identifier;
		self.representedObject = [EXPParser valueForIdentifierName:self.name]; // some kind of environment?
	}
	
	return self;
}

@end
