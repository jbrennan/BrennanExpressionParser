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

@property (readonly) NSString *identifierName;

/**
 Designated initializer.
 
 Creates a new object representing a runtime function.
 
 @note This could be extended to allow for a (potentially variable) number of arguments.
*/
+ (instancetype)newWithIdentifierName:(NSString *)identifierName functionBlock:(EXPRuntimeFunctionBlock)functionBlock;


/**
 Evaluates the function with the given list of arguments.
 
 @note This might eventually change to return an object. For now, it's just a double.
*/
- (double)evaluateWithArguments:(NSArray *)arguments;

#pragma mark - TODO


/**
 This method should return appropriate usage documentation for the function,
 including parameter usage and return value.
 
 Not yet implemented or used.
*/
- (NSString *)documentation;


/**
 This method should return some kind of visualization of the function or its return value.
 It would likely return an image of some kind, or maybe an interactive view.
 
 Not yet implemented or used.
*/
- (id)visualization;

@end
