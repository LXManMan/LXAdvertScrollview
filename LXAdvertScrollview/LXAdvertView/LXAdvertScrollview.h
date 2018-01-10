//
//  LXAdvertScrollview.h
//  LXAdvertScrollview
//
//  Created by chenergou on 2018/1/4.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXAdverModel.h"
@interface LXAdvertScrollview : UIView
@property(nonatomic,strong)NSMutableArray *dataA;

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
@end
