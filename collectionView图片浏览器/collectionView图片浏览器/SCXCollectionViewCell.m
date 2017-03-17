//
//  SCXCollectionViewCell.m
//  collectionView图片浏览器
//
//  Created by 孙承秀 on 16/10/19.
//  Copyright © 2016年 孙先森丶. All rights reserved.
//

#import "SCXCollectionViewCell.h"

@implementation SCXCollectionViewCell
-(void)setImage:(UIImage *)image{
    
    self.imageView.image=image;
    
}
-(UIImageView *)imageView{

    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
        _imageView.frame=CGRectMake(5, 5, self.contentView.frame.size.width-10, self.contentView.frame.size.height-10);
        //_imageView.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}
@end
