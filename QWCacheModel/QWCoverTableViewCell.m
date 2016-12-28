//
//  QWCoverTableViewCell.m
//  CQZX-INK
//
//  Created by qingweiqw on 16/11/6.
//  Copyright © 2016年 qingweiqw. All rights reserved.
//

#import "QWCoverTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"
#import "QWCommonlyConst.h"
#define IMG(imgName) [UIImage imageNamed:imgName]
#define DEFAULTIMAGE  IMG(@"Defaults")
@implementation QWCoverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
    self.headImg.layer.cornerRadius = self.headImg.height/2.0;
    self.headImg.layer.masksToBounds = YES;
    //btn 文字居左
//    self.address.titleLabel.textAlignment = NSTextAlignmentLeft;
//    self.address.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}
- (void)setLModel:(QWLiveModel *)lModel
{
    _lModel = lModel;
   //城市
    if([_lModel.city isEqualToString:@""])
    {
        [self.address setTitle:@"主播在火星妮" forState:UIControlStateNormal];
    }else
    {
        [self.address setTitle:_lModel.city forState:UIControlStateNormal];
    }
    self.Cover.image = DEFAULTIMAGE;
    self.headImg.image = DEFAULTIMAGE;
    
    NSMutableString *imgUrl = [NSMutableString stringWithFormat:@"%@",IMAGE_SERVER_HOST];
    NSString *tempStr =_lModel.creator[@"portrait"];
    if([tempStr hasPrefix:@"http://"])
    {
        [imgUrl setString:tempStr];
    }
    else
    {
        [imgUrl stringByAppendingString:tempStr];
    }
    
    NSLog(@"----------------------%@",imgUrl);
    //设置头像
    [self.Cover sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:DEFAULTIMAGE completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(!error)
        {
         //封面
        self.headImg.image = [UIImage imageWithData:UIImageJPEGRepresentation(image, 0.25)];
        }
        else
        {
            
            
        }
    }];
    //多少人在看
    self.personNumber.text= _lModel.online_users;
    //主播名称
    self.name.text=_lModel.creator[@"nick"];
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
