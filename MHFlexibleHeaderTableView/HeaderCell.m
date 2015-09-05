//
//  HeaderCell.m
//  MHFlexibleHeaderTableView
//
//  Created by mx on 15/9/5.
//  Copyright (c) 2015年 mx. All rights reserved.
//

#import "HeaderCell.h"

@interface HeaderCell ()
@property(nonatomic, weak, readwrite) UILabel* label;
@end

@implementation HeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel* label = [UILabel new];
        {
            label.backgroundColor = [UIColor purpleColor];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont boldSystemFontOfSize:15.0f];
            label.textAlignment = NSTextAlignmentCenter;
            
            label.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:label];
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
            self.label = label;
        }
    }
    return self;
}

@end
