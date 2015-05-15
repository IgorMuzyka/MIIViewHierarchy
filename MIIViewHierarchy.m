//
//  MIIViewHierarchy.m
//
//
//  Created by Igor Muzyka on 5/15/15.
//  Copyright (c) 2015 Igor Muzyka. All rights reserved.
//

#import "MIIViewHierarchy.h"

@interface MIIViewHierarchy ()

@property (nonatomic, strong) NSArray *subviews;
@property (nonatomic, weak) NSArray *constraints;

@end

@implementation MIIViewHierarchy

#pragma mark - init

- (instancetype)initWithView:(MIIView *)view {
    if (self = [super init]) {
        self.view = view;
    }
    return self;
}

+ (instancetype)hierarchyWithView:(MIIView *)view {
    return [[self.class alloc] initWithView:view];
}

#pragma mark - Debug methods

- (id)debugQuickLookObject {
    return self.view;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@; A view hierarchy for <%@: %p>", [super description], NSStringFromClass(self.view.class), self.view];
}

#pragma mark - Hierarchy

- (NSArray *)constructViewHierarchy {
    NSArray *hierarchy = [NSArray new];
    
    for (MIIView *view in self.view.subviews) {
        MIIViewHierarchy *subview = [MIIViewHierarchy new];
        subview.view = view;
        hierarchy = [hierarchy arrayByAddingObject:subview];
    }
    
    return hierarchy;
}

#pragma mark - Mutators

- (void)setView:(MIIView *)view {
    _view = view;
    self.subviews = [self constructViewHierarchy];
    _constraints = self.view.constraints;
    _frame = self.view.frame;
    _bounds = self.view.bounds;
    _backgroundColor = self.view.backgroundColor;
    _tintColor = self.view.tintColor;
    _alpha = self.view.alpha;
    _userInteractionEnabled = self.view.userInteractionEnabled;
    _hidden = self.view.hidden;
}

- (void)setFrame:(MIIRect)frame {
    _frame = frame;
    self.view.frame = _frame;
}

- (void)setBounds:(MIIRect)bounds {
    _bounds = bounds;
    self.view.bounds = _bounds;
}

- (void)setBackgroundColor:(MIIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    self.view.backgroundColor = _backgroundColor;
}

- (void)setTintColor:(MIIColor *)tintColor {
    _tintColor = tintColor;
    self.view.tintColor = _tintColor;
}

- (void)setAlpha:(CGFloat)alpha {
    _alpha = alpha;
    self.view.alpha = alpha;
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled {
    _userInteractionEnabled = userInteractionEnabled;
    self.view.userInteractionEnabled = _userInteractionEnabled;
}

- (void)setHidden:(BOOL)hidden {
    _hidden = hidden;
    self.view.hidden = hidden;
}

#pragma mark - Accessors

- (NSArray *)constraints {
    self.constraints = self.view.constraints;
    return self.constraints;
    return self.constraints = self.view.constraints;
}

@end

#pragma mark -

@implementation MIIView (MIIViewHierarchy)

- (MIIViewHierarchy *)hierarchy {
    return [MIIViewHierarchy hierarchyWithView:self];
}

@end