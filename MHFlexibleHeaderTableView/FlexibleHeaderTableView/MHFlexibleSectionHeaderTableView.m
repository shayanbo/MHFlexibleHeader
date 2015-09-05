//
//  MHFlexibleSectionHeaderTableView.m
//  Apollon
//
//  Created by MickeyHub on 15/9/5.
//  Copyright (c) 2015年 njsqrt3. All rights reserved.
//

#import "MHFlexibleSectionHeaderTableView.h"

@interface MHFlexibleSectionHeaderTableView ()

@property (nonatomic, assign) CGFloat lastContenteOffsetY;
@property (nonatomic, assign) NSUInteger currentSection;
@property (nonatomic, strong) NSLayoutConstraint* topConstraint;
@property (nonatomic, strong) UIView* sectionHeaderView;
@property (nonatomic, strong) Class headerClass;

@end

@implementation MHFlexibleSectionHeaderTableView

#pragma mark - Constructor
+(instancetype)flexibleSectionHeaderTableViewWithHeaderClass:(Class)headerClass{
    
    MHFlexibleSectionHeaderTableView* tableView = [[MHFlexibleSectionHeaderTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.headerClass = headerClass;
    return tableView;
}

-(void)setContentOffset:(CGPoint)contentOffset{
    
    [super setContentOffset:contentOffset];
    
    CGFloat contentOffsetY = contentOffset.y;
    CGRect headerViewOriginalRect = (CGRect){CGPointMake(self.sectionHeaderView.frame.origin.x, contentOffsetY), self.sectionHeaderView.frame.size};
    
    // set current scroll direction
    BOOL scrollUp = self.lastContenteOffsetY - contentOffsetY < 0;
    self.lastContenteOffsetY = contentOffsetY;
    
    //configure data to header
    BOOL sectionChanged = NO;
    NSIndexPath* currentIndexPath = [self indexPathForRowAtPoint:CGPointMake(0, contentOffsetY)];
    if (self.currentSection != currentIndexPath.section) {
        self.currentSection = currentIndexPath.section;
        sectionChanged = YES;
        
        [self configHeaderForSection:self.currentSection];
    }
    
    //base location
    self.topConstraint.constant = contentOffsetY;
    
    if (contentOffsetY <= 0) {
        self.sectionHeaderView.alpha = 0;
        self.sectionHeaderView.hidden = NO;
        return;
    }else{
        self.sectionHeaderView.alpha = 1;
    }
    
    //tuning
    if (scrollUp) {
        
        if (!self.sectionHeaderView.hidden) {
            
            NSUInteger nextSection = self.currentSection + 1;
            if (nextSection < [self.dataSource numberOfSectionsInTableView:self] - 1) {
                
                CGRect nextSectionRect = [self rectForSection:nextSection];
                if (CGRectIntersectsRect(nextSectionRect, headerViewOriginalRect)) {
                    CGFloat deltaOffset = CGRectGetMaxY(headerViewOriginalRect) - CGRectGetMinY(nextSectionRect);
                    self.topConstraint.constant -= deltaOffset;
                }
            }
        }else{
            
            if (sectionChanged) {
                self.sectionHeaderView.hidden = NO;
            }
        }
    }else{
        
        if (!self.sectionHeaderView.hidden) {
            
            NSUInteger nextSection = self.currentSection + 1;
            CGRect nextSectionRect = [self rectForSection:nextSection];
            if (CGRectIntersectsRect(nextSectionRect, headerViewOriginalRect)) {
                CGFloat deltaOffset = CGRectGetMaxY(headerViewOriginalRect) - CGRectGetMinY(nextSectionRect);
                self.topConstraint.constant -= deltaOffset;
            }
            
            if (sectionChanged) {
                self.sectionHeaderView.hidden = YES;
            }
        }
    }
}

#pragma mark - Private
-(void) configHeaderForSection:(NSUInteger)section{
    
    NSAssert(self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(flexibleSectionHeaderTableView:configHeader:forSection:)], @"must follow protocol `MHFlexibleSectionHeaderTableViewDelegate`");
    [self.headerDelegate flexibleSectionHeaderTableView:self configHeader:self.sectionHeaderView forSection:section];
}

-(CGFloat)headeViewHeight{
    
    CGFloat height;
    if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        height = [self.delegate tableView:self heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }else{
        height = 44;
    }
    return height;
}

#pragma mark - Getter
-(UIView*) sectionHeaderView{
    
    if (!_sectionHeaderView) {
        
        _sectionHeaderView = [[self.headerClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        _sectionHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_sectionHeaderView];
        
        UITableView* tableView = self;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_sectionHeaderView(tableView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_sectionHeaderView, tableView)]];
        
        
        [_sectionHeaderView addConstraint:[NSLayoutConstraint constraintWithItem:_sectionHeaderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:[self headeViewHeight]]];
        
        self.topConstraint = [NSLayoutConstraint constraintWithItem:_sectionHeaderView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        [self addConstraint:self.topConstraint];
        
        [self configHeaderForSection:0];
    }
    return _sectionHeaderView;
}

@end
