//
//  LXAdvertScrollview.m
//  LXAdvertScrollview
//
//  Created by chenergou on 2018/1/4.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "LXAdvertScrollview.h"
#import "LXAdvertBaiscCell.h"
static NSInteger const advertScrollViewMaxSections = 100;
@interface LXAdvertScrollview()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)NSTimer *timer;

@end
@implementation LXAdvertScrollview
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}
-(void)setup{
    [self addSubview:self.collectionView];
   
}

- (void)defaultSelectedScetion {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0.5 * advertScrollViewMaxSections] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}
//解决当父View释放时，当前视图因为被Timer强引用而不能释放的问题
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [self removeTimer];
    }
}
-(void)setDataA:(NSMutableArray *)dataA{
    _dataA = dataA;
     [self addTimer];
}
-(void)addTimer{
    [self removeTimer];
    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)removeTimer {
    [_timer invalidate];
    _timer = nil;
}
-(void)beginUpdateUI{
    
    if (self.dataA.count == 0) return;
    
    // 1、当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    //马上显示回最中间那组的数据
    NSIndexPath *resetCurrentIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:0.5 * advertScrollViewMaxSections];
    [self.collectionView scrollToItemAtIndexPath:resetCurrentIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
    
    // 2、计算出下一个需要展示的位置
    NSInteger nextItem = resetCurrentIndexPath.item + 1;
    NSInteger nextSection = resetCurrentIndexPath.section;
    if (nextItem == self.dataA.count) {
        nextItem = 0;
        nextSection++;
    }
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3、通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return advertScrollViewMaxSections;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataA.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LXAdvertBaiscCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LXAdvertBaiscCell" forIndexPath:indexPath];
    
    if (!cell) {
        cell =[[LXAdvertBaiscCell alloc]init];
    }
    cell.model = self.dataA[indexPath.row];
    return cell;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.layout.itemSize = CGSizeMake(self.lx_width, self.lx_height);
    
    if (self.dataA.count > 1) {
         [self defaultSelectedScetion];
    }
}
- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier{
    
    [_collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
    
}
- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier{
     [_collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
       self.layout =[[UICollectionViewFlowLayout alloc]init];
        self.layout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.scrollEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"LXAdvertBaiscCell" bundle:nil] forCellWithReuseIdentifier:@"LXAdvertBaiscCell"];
    }
    return _collectionView;
}
@end
