//
//  LXAdvertBaiscCell.h
//  LXAdvertScrollview
//
//  Created by chenergou on 2018/1/4.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXAdverModel.h"
@interface LXAdvertBaiscCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *advertBackView;
@property(nonatomic,strong)LXAdverModel *model;
@end
