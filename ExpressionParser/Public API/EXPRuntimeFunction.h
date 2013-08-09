//
//  EXPRuntimeFunction.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-09-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The main block type for runtime functions.
 
 @param arguments The arguments (0 or more) passed in to the function when the expression is evaluated.
 @return The result of the function.
*/
typedef double (^EXPRuntimeFunctionBlock)(NSArray *arguments);


/**
 This class represents a math function which can be called at runtime, with a given set of arguments.
 These functions are implemented as Block objects and have an identifier.
*/
@interface EXPRuntimeFunction : NSObject

/**
 Designated initializer.
 
 Creates a new object representing a runtime function.
 */
+ (instancetype)newWithIdentifierName:(NSString *)identifierName functionBlock:(EXPRuntimeFunctionBlock)functionBlock;

@end
