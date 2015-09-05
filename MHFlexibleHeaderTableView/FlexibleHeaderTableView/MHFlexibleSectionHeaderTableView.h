//
//  MHFlexibleSectionHeaderTableView.h
//  Apollon
//
//  Created by MickeyHub on 15/9/5.
//  Copyright (c) 2015年 njsqrt3. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHFlexibleSectionHeaderTableView;
@protocol MHFlexibleSectionHeaderTableViewDelegate <NSObject>

@required
-(void)flexibleSectionHeaderTableView:(MHFlexibleSectionHeaderTableView*)tableView configHeader:(UIView*)header forSection:(NSUInteger)section;
@end

@interface MHFlexibleSectionHeaderTableView : UITableView

@property (nonatomic, weak) id<MHFlexibleSectionHeaderTableViewDelegate> headerDelegate;

+(instancetype)flexibleSectionHeaderTableViewWithHeaderClass:(Class)headerClass;

@end
