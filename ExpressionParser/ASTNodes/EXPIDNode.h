//
//  EXPIDNode.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-08-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPNode.h"


/**
 This class represents an ASTNode for an Identifier (e.g., "someWord1" or "_var" or "sin")
*/
@interface EXPIDNode : EXPNode


/**
 The name of the identifier.
*/
@property NSString *name;


/**
 The object represented by the identifier. This could be e.g., an NSNumber, a Block object (for functions) or something else.
*/
@property id representedObject;


@end
