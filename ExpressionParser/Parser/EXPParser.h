//
//  EXPParser.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const double EXPExpressionParserErrorResult;

/**
 You guessed it, a thin wrapper around CPParser and its delegate.
*/
@interface EXPParser : NSObject

/**
 Returns whether or not the expression is valid and can be evaluated.
*/
- (BOOL)expressionIsValid:(NSString *)expression;


/**
 Evaluates the expression, if it was valid.
 
 @return The result of the expression.
*/
- (double)evaluateExpression:(NSString *)expression;


/**
 Sets an object value keyed by an identifier name, to be used by the EXPIDNode objects.
 Basically, this lets you custommize objects at runtime which will be used by the expression parser.
 You can use this to add new functions or set a number for a variable in the expression.
 
 @param value An object to be represented by an identifier in an expression.
 @param identifierName The name of the identifier as it appears in an expression.
 */
+ (void)setValue:(id)value forIdentifierName:(NSString *)identifierName;

/**
 Returns the value, if any, saved in the environment.
 
 Currently, there is only a single environment for all parsing.
 */
+ (id)valueForIdentifierName:(NSString *)identifierName;

@end
