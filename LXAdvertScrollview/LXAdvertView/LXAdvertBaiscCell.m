//
//  LXAdvertBaiscCell.m
//  LXAdvertScrollview
//
//  Created by chenergou on 2018/1/4.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "LXAdvertBaiscCell.h"
@interface LXAdvertBaiscCell()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@end
@implementation LXAdvertBaiscCell
-(void)setModel:(LXAdverModel *)model{
    _model = model;
    self.leftLabel.text = model.leftTitle;
    self.rightLabel.text = model.rightTitle;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
