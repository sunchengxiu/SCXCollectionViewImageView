//
//  ViewController.m
//  collectionView图片浏览器
//
//  Created by 孙承秀 on 16/10/19.
//  Copyright © 2016年 孙先森丶. All rights reserved.
//

#import "ViewController.h"
#import "SCXFlowLayout.h"
#import "SCXCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@end
static NSString *cellID=@"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SCXFlowLayout *layout=[[SCXFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(160, 160);
    layout.minimumLineSpacing=50;
    //让开始的和最后那个居中
    CGFloat margin=(self.view.frame.size.width-160)*0.5;
    layout.sectionInset=UIEdgeInsetsMake(0, margin, 0, margin);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.center=self.view.center;
    collectionView.bounds=CGRectMake(0, 0, self.view.bounds.size.width, 200);
    collectionView.backgroundColor=[UIColor brownColor];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    self.collectionView=collectionView;
    collectionView.showsHorizontalScrollIndicator=NO;
    collectionView.showsVerticalScrollIndicator=NO;
    [collectionView registerClass:[SCXCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:collectionView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SCXCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.image=[UIImage imageNamed:@"file_icon_docx"];

    return cell;

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
