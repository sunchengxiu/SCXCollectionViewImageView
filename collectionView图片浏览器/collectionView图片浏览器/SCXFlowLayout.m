//
//  SCXFlowLayout.m
//  collectionView图片浏览器
//
//  Created by 孙承秀 on 16/10/19.
//  Copyright © 2016年 孙先森丶. All rights reserved.
//

#import "SCXFlowLayout.h"

@implementation SCXFlowLayout
/**
 一运行的时候和reload的时候就会调用
 */
//-(void)prepareLayout{
//    [super prepareLayout];
//}

/**
 获取指定rect下面的所有布局
 下来用来设置缩放
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //获取当前cell显示的布局
    NSArray *array= [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    for (UICollectionViewLayoutAttributes *attribute in array) {
        CGFloat attributeCenterX=attribute.center.x;
        NSLog(@"---%f",attributeCenterX);
        NSLog(@"~~~%f",self.collectionView.contentOffset.x);
        //当前cell距离中心店的位置
        CGFloat centerX=fabs((attributeCenterX-self.collectionView.contentOffset.x)-self.collectionView.bounds.size.width/2);
        //设置距离中心店的比例，距离越远，缩放越小
        CGFloat scale=1-(centerX/(self.collectionView.bounds.size.width*0.5))*0.25;
        NSLog(@"%f",scale);
        attribute.transform=CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}



/**
 是否刷新布局，刷新的话会每次都调用上面的方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;

}
#pragma mark--确定最终偏移量，用来定位使用

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //获取最终显示区域
    CGPoint targetPoint=[super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    CGRect rect=CGRectMake(targetPoint.x, 0, self.collectionView.bounds.size.width, MAXFLOAT);
    //获取最终显示的cell
    NSArray *arr=[super layoutAttributesForElementsInRect:rect];
    CGFloat min=MAXFLOAT;
    //获取离中心店最近额哪一个
    for (UICollectionViewLayoutAttributes *attribute in arr) {
        CGFloat delta=attribute.center.x-self.collectionView.bounds.size.width/2-self.collectionView.contentOffset.x;
        if (fabs(delta)<fabs(min)) {
            min=delta;
        }
    }
    targetPoint.x+=min;
    if (targetPoint.x<0) {
        targetPoint.x=0;
    }
    return targetPoint;
}
@end
