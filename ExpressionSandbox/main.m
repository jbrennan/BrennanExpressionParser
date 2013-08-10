//
//  main.m
//  ExpressionSandbox
//
//  Created by Jason Brennan on Aug-10-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionParser.h"

int main(int argc, const char * argv[]) {

	@autoreleasepool {
	    
	    EXPExpressionParser *parser = [EXPExpressionParser new];
		double result = [parser evaluateExpression:@"sqrt(x)"];
		NSLog(@"%f", result);
		
		[parser setValue:@25 forSymbolNameInExpression:@"x"];
		result = [parser evaluateExpression:@"sqrt(x)"];
		NSLog(@"%f", result);
	    
	}
    return 0;
}

